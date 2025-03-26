import { TestBed } from '@angular/core/testing';

import { sampleWithNewData, sampleWithRequiredData } from '../parent-organization.test-samples';

import { ParentOrganizationFormService } from './parent-organization-form.service';

describe('ParentOrganization Form Service', () => {
  let service: ParentOrganizationFormService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(ParentOrganizationFormService);
  });

  describe('Service methods', () => {
    describe('createParentOrganizationFormGroup', () => {
      it('should create a new form with FormControl', () => {
        const formGroup = service.createParentOrganizationFormGroup();

        expect(formGroup.controls).toEqual(
          expect.objectContaining({
            id: expect.any(Object),
            name: expect.any(Object),
          }),
        );
      });

      it('passing IParentOrganization should create a new form with FormGroup', () => {
        const formGroup = service.createParentOrganizationFormGroup(sampleWithRequiredData);

        expect(formGroup.controls).toEqual(
          expect.objectContaining({
            id: expect.any(Object),
            name: expect.any(Object),
          }),
        );
      });
    });

    describe('getParentOrganization', () => {
      it('should return NewParentOrganization for default ParentOrganization initial value', () => {
        const formGroup = service.createParentOrganizationFormGroup(sampleWithNewData);

        const parentOrganization = service.getParentOrganization(formGroup) as any;

        expect(parentOrganization).toMatchObject(sampleWithNewData);
      });

      it('should return NewParentOrganization for empty ParentOrganization initial value', () => {
        const formGroup = service.createParentOrganizationFormGroup();

        const parentOrganization = service.getParentOrganization(formGroup) as any;

        expect(parentOrganization).toMatchObject({});
      });

      it('should return IParentOrganization', () => {
        const formGroup = service.createParentOrganizationFormGroup(sampleWithRequiredData);

        const parentOrganization = service.getParentOrganization(formGroup) as any;

        expect(parentOrganization).toMatchObject(sampleWithRequiredData);
      });
    });

    describe('resetForm', () => {
      it('passing IParentOrganization should not enable id FormControl', () => {
        const formGroup = service.createParentOrganizationFormGroup();
        expect(formGroup.controls.id.disabled).toBe(true);

        service.resetForm(formGroup, sampleWithRequiredData);

        expect(formGroup.controls.id.disabled).toBe(true);
      });

      it('passing NewParentOrganization should disable id FormControl', () => {
        const formGroup = service.createParentOrganizationFormGroup(sampleWithRequiredData);
        expect(formGroup.controls.id.disabled).toBe(true);

        service.resetForm(formGroup, { id: null });

        expect(formGroup.controls.id.disabled).toBe(true);
      });
    });
  });
});
