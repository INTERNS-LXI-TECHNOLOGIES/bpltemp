import { TestBed } from '@angular/core/testing';

import { sampleWithNewData, sampleWithRequiredData } from '../facility-type.test-samples';

import { FacilityTypeFormService } from './facility-type-form.service';

describe('FacilityType Form Service', () => {
  let service: FacilityTypeFormService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(FacilityTypeFormService);
  });

  describe('Service methods', () => {
    describe('createFacilityTypeFormGroup', () => {
      it('should create a new form with FormControl', () => {
        const formGroup = service.createFacilityTypeFormGroup();

        expect(formGroup.controls).toEqual(
          expect.objectContaining({
            id: expect.any(Object),
            name: expect.any(Object),
          }),
        );
      });

      it('passing IFacilityType should create a new form with FormGroup', () => {
        const formGroup = service.createFacilityTypeFormGroup(sampleWithRequiredData);

        expect(formGroup.controls).toEqual(
          expect.objectContaining({
            id: expect.any(Object),
            name: expect.any(Object),
          }),
        );
      });
    });

    describe('getFacilityType', () => {
      it('should return NewFacilityType for default FacilityType initial value', () => {
        const formGroup = service.createFacilityTypeFormGroup(sampleWithNewData);

        const facilityType = service.getFacilityType(formGroup) as any;

        expect(facilityType).toMatchObject(sampleWithNewData);
      });

      it('should return NewFacilityType for empty FacilityType initial value', () => {
        const formGroup = service.createFacilityTypeFormGroup();

        const facilityType = service.getFacilityType(formGroup) as any;

        expect(facilityType).toMatchObject({});
      });

      it('should return IFacilityType', () => {
        const formGroup = service.createFacilityTypeFormGroup(sampleWithRequiredData);

        const facilityType = service.getFacilityType(formGroup) as any;

        expect(facilityType).toMatchObject(sampleWithRequiredData);
      });
    });

    describe('resetForm', () => {
      it('passing IFacilityType should not enable id FormControl', () => {
        const formGroup = service.createFacilityTypeFormGroup();
        expect(formGroup.controls.id.disabled).toBe(true);

        service.resetForm(formGroup, sampleWithRequiredData);

        expect(formGroup.controls.id.disabled).toBe(true);
      });

      it('passing NewFacilityType should disable id FormControl', () => {
        const formGroup = service.createFacilityTypeFormGroup(sampleWithRequiredData);
        expect(formGroup.controls.id.disabled).toBe(true);

        service.resetForm(formGroup, { id: null });

        expect(formGroup.controls.id.disabled).toBe(true);
      });
    });
  });
});
