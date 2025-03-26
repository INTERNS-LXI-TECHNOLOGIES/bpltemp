import { TestBed } from '@angular/core/testing';

import { sampleWithNewData, sampleWithRequiredData } from '../shipment-method.test-samples';

import { ShipmentMethodFormService } from './shipment-method-form.service';

describe('ShipmentMethod Form Service', () => {
  let service: ShipmentMethodFormService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(ShipmentMethodFormService);
  });

  describe('Service methods', () => {
    describe('createShipmentMethodFormGroup', () => {
      it('should create a new form with FormControl', () => {
        const formGroup = service.createShipmentMethodFormGroup();

        expect(formGroup.controls).toEqual(
          expect.objectContaining({
            id: expect.any(Object),
            name: expect.any(Object),
            description: expect.any(Object),
            parentType: expect.any(Object),
          }),
        );
      });

      it('passing IShipmentMethod should create a new form with FormGroup', () => {
        const formGroup = service.createShipmentMethodFormGroup(sampleWithRequiredData);

        expect(formGroup.controls).toEqual(
          expect.objectContaining({
            id: expect.any(Object),
            name: expect.any(Object),
            description: expect.any(Object),
            parentType: expect.any(Object),
          }),
        );
      });
    });

    describe('getShipmentMethod', () => {
      it('should return NewShipmentMethod for default ShipmentMethod initial value', () => {
        const formGroup = service.createShipmentMethodFormGroup(sampleWithNewData);

        const shipmentMethod = service.getShipmentMethod(formGroup) as any;

        expect(shipmentMethod).toMatchObject(sampleWithNewData);
      });

      it('should return NewShipmentMethod for empty ShipmentMethod initial value', () => {
        const formGroup = service.createShipmentMethodFormGroup();

        const shipmentMethod = service.getShipmentMethod(formGroup) as any;

        expect(shipmentMethod).toMatchObject({});
      });

      it('should return IShipmentMethod', () => {
        const formGroup = service.createShipmentMethodFormGroup(sampleWithRequiredData);

        const shipmentMethod = service.getShipmentMethod(formGroup) as any;

        expect(shipmentMethod).toMatchObject(sampleWithRequiredData);
      });
    });

    describe('resetForm', () => {
      it('passing IShipmentMethod should not enable id FormControl', () => {
        const formGroup = service.createShipmentMethodFormGroup();
        expect(formGroup.controls.id.disabled).toBe(true);

        service.resetForm(formGroup, sampleWithRequiredData);

        expect(formGroup.controls.id.disabled).toBe(true);
      });

      it('passing NewShipmentMethod should disable id FormControl', () => {
        const formGroup = service.createShipmentMethodFormGroup(sampleWithRequiredData);
        expect(formGroup.controls.id.disabled).toBe(true);

        service.resetForm(formGroup, { id: null });

        expect(formGroup.controls.id.disabled).toBe(true);
      });
    });
  });
});
