import { ComponentFixture, TestBed } from '@angular/core/testing';
import { HttpResponse, provideHttpClient } from '@angular/common/http';
import { FormBuilder } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import { Subject, from, of } from 'rxjs';

import { ParentorganizationService } from '../service/parentorganization.service';
import { IParentorganization } from '../parentorganization.model';
import { ParentorganizationFormService } from './parentorganization-form.service';

import { ParentorganizationUpdateComponent } from './parentorganization-update.component';

describe('Parentorganization Management Update Component', () => {
  let comp: ParentorganizationUpdateComponent;
  let fixture: ComponentFixture<ParentorganizationUpdateComponent>;
  let activatedRoute: ActivatedRoute;
  let parentorganizationFormService: ParentorganizationFormService;
  let parentorganizationService: ParentorganizationService;

  beforeEach(() => {
    TestBed.configureTestingModule({
      imports: [ParentorganizationUpdateComponent],
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
      .overrideTemplate(ParentorganizationUpdateComponent, '')
      .compileComponents();

    fixture = TestBed.createComponent(ParentorganizationUpdateComponent);
    activatedRoute = TestBed.inject(ActivatedRoute);
    parentorganizationFormService = TestBed.inject(ParentorganizationFormService);
    parentorganizationService = TestBed.inject(ParentorganizationService);

    comp = fixture.componentInstance;
  });

  describe('ngOnInit', () => {
    it('Should update editForm', () => {
      const parentorganization: IParentorganization = { id: 22935 };

      activatedRoute.data = of({ parentorganization });
      comp.ngOnInit();

      expect(comp.parentorganization).toEqual(parentorganization);
    });
  });

  describe('save', () => {
    it('Should call update service on save for existing entity', () => {
      // GIVEN
      const saveSubject = new Subject<HttpResponse<IParentorganization>>();
      const parentorganization = { id: 4781 };
      jest.spyOn(parentorganizationFormService, 'getParentorganization').mockReturnValue(parentorganization);
      jest.spyOn(parentorganizationService, 'update').mockReturnValue(saveSubject);
      jest.spyOn(comp, 'previousState');
      activatedRoute.data = of({ parentorganization });
      comp.ngOnInit();

      // WHEN
      comp.save();
      expect(comp.isSaving).toEqual(true);
      saveSubject.next(new HttpResponse({ body: parentorganization }));
      saveSubject.complete();

      // THEN
      expect(parentorganizationFormService.getParentorganization).toHaveBeenCalled();
      expect(comp.previousState).toHaveBeenCalled();
      expect(parentorganizationService.update).toHaveBeenCalledWith(expect.objectContaining(parentorganization));
      expect(comp.isSaving).toEqual(false);
    });

    it('Should call create service on save for new entity', () => {
      // GIVEN
      const saveSubject = new Subject<HttpResponse<IParentorganization>>();
      const parentorganization = { id: 4781 };
      jest.spyOn(parentorganizationFormService, 'getParentorganization').mockReturnValue({ id: null });
      jest.spyOn(parentorganizationService, 'create').mockReturnValue(saveSubject);
      jest.spyOn(comp, 'previousState');
      activatedRoute.data = of({ parentorganization: null });
      comp.ngOnInit();

      // WHEN
      comp.save();
      expect(comp.isSaving).toEqual(true);
      saveSubject.next(new HttpResponse({ body: parentorganization }));
      saveSubject.complete();

      // THEN
      expect(parentorganizationFormService.getParentorganization).toHaveBeenCalled();
      expect(parentorganizationService.create).toHaveBeenCalled();
      expect(comp.isSaving).toEqual(false);
      expect(comp.previousState).toHaveBeenCalled();
    });

    it('Should set isSaving to false on error', () => {
      // GIVEN
      const saveSubject = new Subject<HttpResponse<IParentorganization>>();
      const parentorganization = { id: 4781 };
      jest.spyOn(parentorganizationService, 'update').mockReturnValue(saveSubject);
      jest.spyOn(comp, 'previousState');
      activatedRoute.data = of({ parentorganization });
      comp.ngOnInit();

      // WHEN
      comp.save();
      expect(comp.isSaving).toEqual(true);
      saveSubject.error('This is an error!');

      // THEN
      expect(parentorganizationService.update).toHaveBeenCalled();
      expect(comp.isSaving).toEqual(false);
      expect(comp.previousState).not.toHaveBeenCalled();
    });
  });
});
