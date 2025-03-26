import { ComponentFixture, TestBed } from '@angular/core/testing';
import { HttpResponse, provideHttpClient } from '@angular/common/http';
import { FormBuilder } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import { Subject, from, of } from 'rxjs';

import { ParentOrganizationService } from '../service/parent-organization.service';
import { IParentOrganization } from '../parent-organization.model';
import { ParentOrganizationFormService } from './parent-organization-form.service';

import { ParentOrganizationUpdateComponent } from './parent-organization-update.component';

describe('ParentOrganization Management Update Component', () => {
  let comp: ParentOrganizationUpdateComponent;
  let fixture: ComponentFixture<ParentOrganizationUpdateComponent>;
  let activatedRoute: ActivatedRoute;
  let parentOrganizationFormService: ParentOrganizationFormService;
  let parentOrganizationService: ParentOrganizationService;

  beforeEach(() => {
    TestBed.configureTestingModule({
      imports: [ParentOrganizationUpdateComponent],
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
      .overrideTemplate(ParentOrganizationUpdateComponent, '')
      .compileComponents();

    fixture = TestBed.createComponent(ParentOrganizationUpdateComponent);
    activatedRoute = TestBed.inject(ActivatedRoute);
    parentOrganizationFormService = TestBed.inject(ParentOrganizationFormService);
    parentOrganizationService = TestBed.inject(ParentOrganizationService);

    comp = fixture.componentInstance;
  });

  describe('ngOnInit', () => {
    it('Should update editForm', () => {
      const parentOrganization: IParentOrganization = { id: 22935 };

      activatedRoute.data = of({ parentOrganization });
      comp.ngOnInit();

      expect(comp.parentOrganization).toEqual(parentOrganization);
    });
  });

  describe('save', () => {
    it('Should call update service on save for existing entity', () => {
      // GIVEN
      const saveSubject = new Subject<HttpResponse<IParentOrganization>>();
      const parentOrganization = { id: 4781 };
      jest.spyOn(parentOrganizationFormService, 'getParentOrganization').mockReturnValue(parentOrganization);
      jest.spyOn(parentOrganizationService, 'update').mockReturnValue(saveSubject);
      jest.spyOn(comp, 'previousState');
      activatedRoute.data = of({ parentOrganization });
      comp.ngOnInit();

      // WHEN
      comp.save();
      expect(comp.isSaving).toEqual(true);
      saveSubject.next(new HttpResponse({ body: parentOrganization }));
      saveSubject.complete();

      // THEN
      expect(parentOrganizationFormService.getParentOrganization).toHaveBeenCalled();
      expect(comp.previousState).toHaveBeenCalled();
      expect(parentOrganizationService.update).toHaveBeenCalledWith(expect.objectContaining(parentOrganization));
      expect(comp.isSaving).toEqual(false);
    });

    it('Should call create service on save for new entity', () => {
      // GIVEN
      const saveSubject = new Subject<HttpResponse<IParentOrganization>>();
      const parentOrganization = { id: 4781 };
      jest.spyOn(parentOrganizationFormService, 'getParentOrganization').mockReturnValue({ id: null });
      jest.spyOn(parentOrganizationService, 'create').mockReturnValue(saveSubject);
      jest.spyOn(comp, 'previousState');
      activatedRoute.data = of({ parentOrganization: null });
      comp.ngOnInit();

      // WHEN
      comp.save();
      expect(comp.isSaving).toEqual(true);
      saveSubject.next(new HttpResponse({ body: parentOrganization }));
      saveSubject.complete();

      // THEN
      expect(parentOrganizationFormService.getParentOrganization).toHaveBeenCalled();
      expect(parentOrganizationService.create).toHaveBeenCalled();
      expect(comp.isSaving).toEqual(false);
      expect(comp.previousState).toHaveBeenCalled();
    });

    it('Should set isSaving to false on error', () => {
      // GIVEN
      const saveSubject = new Subject<HttpResponse<IParentOrganization>>();
      const parentOrganization = { id: 4781 };
      jest.spyOn(parentOrganizationService, 'update').mockReturnValue(saveSubject);
      jest.spyOn(comp, 'previousState');
      activatedRoute.data = of({ parentOrganization });
      comp.ngOnInit();

      // WHEN
      comp.save();
      expect(comp.isSaving).toEqual(true);
      saveSubject.error('This is an error!');

      // THEN
      expect(parentOrganizationService.update).toHaveBeenCalled();
      expect(comp.isSaving).toEqual(false);
      expect(comp.previousState).not.toHaveBeenCalled();
    });
  });
});
