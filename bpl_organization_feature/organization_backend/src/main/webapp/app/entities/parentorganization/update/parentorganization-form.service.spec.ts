import { TestBed } from '@angular/core/testing';

import { sampleWithNewData, sampleWithRequiredData } from '../parentorganization.test-samples';

import { ParentorganizationFormService } from './parentorganization-form.service';

describe('Parentorganization Form Service', () => {
  let service: ParentorganizationFormService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(ParentorganizationFormService);
  });

  describe('Service methods', () => {
    describe('createParentorganizationFormGroup', () => {
      it('should create a new form with FormControl', () => {
        const formGroup = service.createParentorganizationFormGroup();

        expect(formGroup.controls).toEqual(
          expect.objectContaining({
            id: expect.any(Object),
            name: expect.any(Object),
            description: expect.any(Object),
          }),
        );
      });

      it('passing IParentorganization should create a new form with FormGroup', () => {
        const formGroup = service.createParentorganizationFormGroup(sampleWithRequiredData);

        expect(formGroup.controls).toEqual(
          expect.objectContaining({
            id: expect.any(Object),
            name: expect.any(Object),
            description: expect.any(Object),
          }),
        );
      });
    });

    describe('getParentorganization', () => {
      it('should return NewParentorganization for default Parentorganization initial value', () => {
        const formGroup = service.createParentorganizationFormGroup(sampleWithNewData);

        const parentorganization = service.getParentorganization(formGroup) as any;

        expect(parentorganization).toMatchObject(sampleWithNewData);
      });

      it('should return NewParentorganization for empty Parentorganization initial value', () => {
        const formGroup = service.createParentorganizationFormGroup();

        const parentorganization = service.getParentorganization(formGroup) as any;

        expect(parentorganization).toMatchObject({});
      });

      it('should return IParentorganization', () => {
        const formGroup = service.createParentorganizationFormGroup(sampleWithRequiredData);

        const parentorganization = service.getParentorganization(formGroup) as any;

        expect(parentorganization).toMatchObject(sampleWithRequiredData);
      });
    });

    describe('resetForm', () => {
      it('passing IParentorganization should not enable id FormControl', () => {
        const formGroup = service.createParentorganizationFormGroup();
        expect(formGroup.controls.id.disabled).toBe(true);

        service.resetForm(formGroup, sampleWithRequiredData);

        expect(formGroup.controls.id.disabled).toBe(true);
      });

      it('passing NewParentorganization should disable id FormControl', () => {
        const formGroup = service.createParentorganizationFormGroup(sampleWithRequiredData);
        expect(formGroup.controls.id.disabled).toBe(true);

        service.resetForm(formGroup, { id: null });

        expect(formGroup.controls.id.disabled).toBe(true);
      });
    });
  });
});
