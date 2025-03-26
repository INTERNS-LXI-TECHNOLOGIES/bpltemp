import { ComponentFixture, TestBed } from '@angular/core/testing';
import { HttpResponse, provideHttpClient } from '@angular/common/http';
import { FormBuilder } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import { Subject, from, of } from 'rxjs';

import { IParentOrganization } from 'app/entities/parent-organization/parent-organization.model';
import { ParentOrganizationService } from 'app/entities/parent-organization/service/parent-organization.service';
import { OrganizationService } from '../service/organization.service';
import { IOrganization } from '../organization.model';
import { OrganizationFormService } from './organization-form.service';

import { OrganizationUpdateComponent } from './organization-update.component';

describe('Organization Management Update Component', () => {
  let comp: OrganizationUpdateComponent;
  let fixture: ComponentFixture<OrganizationUpdateComponent>;
  let activatedRoute: ActivatedRoute;
  let organizationFormService: OrganizationFormService;
  let organizationService: OrganizationService;
  let parentOrganizationService: ParentOrganizationService;

  beforeEach(() => {
    TestBed.configureTestingModule({
      imports: [OrganizationUpdateComponent],
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
      .overrideTemplate(OrganizationUpdateComponent, '')
      .compileComponents();

    fixture = TestBed.createComponent(OrganizationUpdateComponent);
    activatedRoute = TestBed.inject(ActivatedRoute);
    organizationFormService = TestBed.inject(OrganizationFormService);
    organizationService = TestBed.inject(OrganizationService);
    parentOrganizationService = TestBed.inject(ParentOrganizationService);

    comp = fixture.componentInstance;
  });

  describe('ngOnInit', () => {
    it('Should call parentOrganization query and add missing value', () => {
      const organization: IOrganization = { id: 21219 };
      const parentOrganization: IParentOrganization = { id: 4781 };
      organization.parentOrganization = parentOrganization;

      const parentOrganizationCollection: IParentOrganization[] = [{ id: 4781 }];
      jest.spyOn(parentOrganizationService, 'query').mockReturnValue(of(new HttpResponse({ body: parentOrganizationCollection })));
      const expectedCollection: IParentOrganization[] = [parentOrganization, ...parentOrganizationCollection];
      jest.spyOn(parentOrganizationService, 'addParentOrganizationToCollectionIfMissing').mockReturnValue(expectedCollection);

      activatedRoute.data = of({ organization });
      comp.ngOnInit();

      expect(parentOrganizationService.query).toHaveBeenCalled();
      expect(parentOrganizationService.addParentOrganizationToCollectionIfMissing).toHaveBeenCalledWith(
        parentOrganizationCollection,
        parentOrganization,
      );
      expect(comp.parentOrganizationsCollection).toEqual(expectedCollection);
    });

    it('Should update editForm', () => {
      const organization: IOrganization = { id: 21219 };
      const parentOrganization: IParentOrganization = { id: 4781 };
      organization.parentOrganization = parentOrganization;

      activatedRoute.data = of({ organization });
      comp.ngOnInit();

      expect(comp.parentOrganizationsCollection).toContainEqual(parentOrganization);
      expect(comp.organization).toEqual(organization);
    });
  });

  describe('save', () => {
    it('Should call update service on save for existing entity', () => {
      // GIVEN
      const saveSubject = new Subject<HttpResponse<IOrganization>>();
      const organization = { id: 15986 };
      jest.spyOn(organizationFormService, 'getOrganization').mockReturnValue(organization);
      jest.spyOn(organizationService, 'update').mockReturnValue(saveSubject);
      jest.spyOn(comp, 'previousState');
      activatedRoute.data = of({ organization });
      comp.ngOnInit();

      // WHEN
      comp.save();
      expect(comp.isSaving).toEqual(true);
      saveSubject.next(new HttpResponse({ body: organization }));
      saveSubject.complete();

      // THEN
      expect(organizationFormService.getOrganization).toHaveBeenCalled();
      expect(comp.previousState).toHaveBeenCalled();
      expect(organizationService.update).toHaveBeenCalledWith(expect.objectContaining(organization));
      expect(comp.isSaving).toEqual(false);
    });

    it('Should call create service on save for new entity', () => {
      // GIVEN
      const saveSubject = new Subject<HttpResponse<IOrganization>>();
      const organization = { id: 15986 };
      jest.spyOn(organizationFormService, 'getOrganization').mockReturnValue({ id: null });
      jest.spyOn(organizationService, 'create').mockReturnValue(saveSubject);
      jest.spyOn(comp, 'previousState');
      activatedRoute.data = of({ organization: null });
      comp.ngOnInit();

      // WHEN
      comp.save();
      expect(comp.isSaving).toEqual(true);
      saveSubject.next(new HttpResponse({ body: organization }));
      saveSubject.complete();

      // THEN
      expect(organizationFormService.getOrganization).toHaveBeenCalled();
      expect(organizationService.create).toHaveBeenCalled();
      expect(comp.isSaving).toEqual(false);
      expect(comp.previousState).toHaveBeenCalled();
    });

    it('Should set isSaving to false on error', () => {
      // GIVEN
      const saveSubject = new Subject<HttpResponse<IOrganization>>();
      const organization = { id: 15986 };
      jest.spyOn(organizationService, 'update').mockReturnValue(saveSubject);
      jest.spyOn(comp, 'previousState');
      activatedRoute.data = of({ organization });
      comp.ngOnInit();

      // WHEN
      comp.save();
      expect(comp.isSaving).toEqual(true);
      saveSubject.error('This is an error!');

      // THEN
      expect(organizationService.update).toHaveBeenCalled();
      expect(comp.isSaving).toEqual(false);
      expect(comp.previousState).not.toHaveBeenCalled();
    });
  });

  describe('Compare relationships', () => {
    describe('compareParentOrganization', () => {
      it('Should forward to parentOrganizationService', () => {
        const entity = { id: 4781 };
        const entity2 = { id: 22935 };
        jest.spyOn(parentOrganizationService, 'compareParentOrganization');
        comp.compareParentOrganization(entity, entity2);
        expect(parentOrganizationService.compareParentOrganization).toHaveBeenCalledWith(entity, entity2);
      });
    });
  });
});
