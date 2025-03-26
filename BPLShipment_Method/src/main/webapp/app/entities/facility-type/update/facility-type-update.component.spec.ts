import { ComponentFixture, TestBed } from '@angular/core/testing';
import { HttpResponse, provideHttpClient } from '@angular/common/http';
import { FormBuilder } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import { Subject, from, of } from 'rxjs';

import { FacilityTypeService } from '../service/facility-type.service';
import { IFacilityType } from '../facility-type.model';
import { FacilityTypeFormService } from './facility-type-form.service';

import { FacilityTypeUpdateComponent } from './facility-type-update.component';

describe('FacilityType Management Update Component', () => {
  let comp: FacilityTypeUpdateComponent;
  let fixture: ComponentFixture<FacilityTypeUpdateComponent>;
  let activatedRoute: ActivatedRoute;
  let facilityTypeFormService: FacilityTypeFormService;
  let facilityTypeService: FacilityTypeService;

  beforeEach(() => {
    TestBed.configureTestingModule({
      imports: [FacilityTypeUpdateComponent],
      providers: [
        provideHttpClient(),
        FormBuilder,
        {
          provide: ActivatedRoute,
          useValue: {
            params: from([{}]),
          },
        },
      ],
    })
      .overrideTemplate(FacilityTypeUpdateComponent, '')
      .compileComponents();

    fixture = TestBed.createComponent(FacilityTypeUpdateComponent);
    activatedRoute = TestBed.inject(ActivatedRoute);
    facilityTypeFormService = TestBed.inject(FacilityTypeFormService);
    facilityTypeService = TestBed.inject(FacilityTypeService);

    comp = fixture.componentInstance;
  });

  describe('ngOnInit', () => {
    it('Should update editForm', () => {
      const facilityType: IFacilityType = { id: 4814 };

      activatedRoute.data = of({ facilityType });
      comp.ngOnInit();

      expect(comp.facilityType).toEqual(facilityType);
    });
  });

  describe('save', () => {
    it('Should call update service on save for existing entity', () => {
      // GIVEN
      const saveSubject = new Subject<HttpResponse<IFacilityType>>();
      const facilityType = { id: 18255 };
      jest.spyOn(facilityTypeFormService, 'getFacilityType').mockReturnValue(facilityType);
      jest.spyOn(facilityTypeService, 'update').mockReturnValue(saveSubject);
      jest.spyOn(comp, 'previousState');
      activatedRoute.data = of({ facilityType });
      comp.ngOnInit();

      // WHEN
      comp.save();
      expect(comp.isSaving).toEqual(true);
      saveSubject.next(new HttpResponse({ body: facilityType }));
      saveSubject.complete();

      // THEN
      expect(facilityTypeFormService.getFacilityType).toHaveBeenCalled();
      expect(comp.previousState).toHaveBeenCalled();
      expect(facilityTypeService.update).toHaveBeenCalledWith(expect.objectContaining(facilityType));
      expect(comp.isSaving).toEqual(false);
    });

    it('Should call create service on save for new entity', () => {
      // GIVEN
      const saveSubject = new Subject<HttpResponse<IFacilityType>>();
      const facilityType = { id: 18255 };
      jest.spyOn(facilityTypeFormService, 'getFacilityType').mockReturnValue({ id: null });
      jest.spyOn(facilityTypeService, 'create').mockReturnValue(saveSubject);
      jest.spyOn(comp, 'previousState');
      activatedRoute.data = of({ facilityType: null });
      comp.ngOnInit();

      // WHEN
      comp.save();
      expect(comp.isSaving).toEqual(true);
      saveSubject.next(new HttpResponse({ body: facilityType }));
      saveSubject.complete();

      // THEN
      expect(facilityTypeFormService.getFacilityType).toHaveBeenCalled();
      expect(facilityTypeService.create).toHaveBeenCalled();
      expect(comp.isSaving).toEqual(false);
      expect(comp.previousState).toHaveBeenCalled();
    });

    it('Should set isSaving to false on error', () => {
      // GIVEN
      const saveSubject = new Subject<HttpResponse<IFacilityType>>();
      const facilityType = { id: 18255 };
      jest.spyOn(facilityTypeService, 'update').mockReturnValue(saveSubject);
      jest.spyOn(comp, 'previousState');
      activatedRoute.data = of({ facilityType });
      comp.ngOnInit();

      // WHEN
      comp.save();
      expect(comp.isSaving).toEqual(true);
      saveSubject.error('This is an error!');

      // THEN
      expect(facilityTypeService.update).toHaveBeenCalled();
      expect(comp.isSaving).toEqual(false);
      expect(comp.previousState).not.toHaveBeenCalled();
    });
  });
});
