import { TestBed } from '@angular/core/testing';

import { sampleWithNewData, sampleWithRequiredData } from '../way-bill.test-samples';

import { WayBillFormService } from './way-bill-form.service';

describe('WayBill Form Service', () => {
  let service: WayBillFormService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(WayBillFormService);
  });

  describe('Service methods', () => {
    describe('createWayBillFormGroup', () => {
      it('should create a new form with FormControl', () => {
        const formGroup = service.createWayBillFormGroup();

        expect(formGroup.controls).toEqual(
          expect.objectContaining({
            id: expect.any(Object),
            boxLimit: expect.any(Object),
            shipmentType: expect.any(Object),
            opfac: expect.any(Object),
            deliveryAgent: expect.any(Object),
            estimatedReadyDate: expect.any(Object),
            currencyUom: expect.any(Object),
            estimatedShipDate: expect.any(Object),
            status: expect.any(Object),
            referenceNumber: expect.any(Object),
            currencyType: expect.any(Object),
          }),
        );
      });

      it('passing IWayBill should create a new form with FormGroup', () => {
        const formGroup = service.createWayBillFormGroup(sampleWithRequiredData);

        expect(formGroup.controls).toEqual(
          expect.objectContaining({
            id: expect.any(Object),
            boxLimit: expect.any(Object),
            shipmentType: expect.any(Object),
            opfac: expect.any(Object),
            deliveryAgent: expect.any(Object),
            estimatedReadyDate: expect.any(Object),
            currencyUom: expect.any(Object),
            estimatedShipDate: expect.any(Object),
            status: expect.any(Object),
            referenceNumber: expect.any(Object),
            currencyType: expect.any(Object),
          }),
        );
      });
    });

    describe('getWayBill', () => {
      it('should return NewWayBill for default WayBill initial value', () => {
        const formGroup = service.createWayBillFormGroup(sampleWithNewData);

        const wayBill = service.getWayBill(formGroup) as any;

        expect(wayBill).toMatchObject(sampleWithNewData);
      });

      it('should return NewWayBill for empty WayBill initial value', () => {
        const formGroup = service.createWayBillFormGroup();

        const wayBill = service.getWayBill(formGroup) as any;

        expect(wayBill).toMatchObject({});
      });

      it('should return IWayBill', () => {
        const formGroup = service.createWayBillFormGroup(sampleWithRequiredData);

        const wayBill = service.getWayBill(formGroup) as any;

        expect(wayBill).toMatchObject(sampleWithRequiredData);
      });
    });

    describe('resetForm', () => {
      it('passing IWayBill should not enable id FormControl', () => {
        const formGroup = service.createWayBillFormGroup();
        expect(formGroup.controls.id.disabled).toBe(true);

        service.resetForm(formGroup, sampleWithRequiredData);

        expect(formGroup.controls.id.disabled).toBe(true);
      });

      it('passing NewWayBill should disable id FormControl', () => {
        const formGroup = service.createWayBillFormGroup(sampleWithRequiredData);
        expect(formGroup.controls.id.disabled).toBe(true);

        service.resetForm(formGroup, { id: null });

        expect(formGroup.controls.id.disabled).toBe(true);
      });
    });
  });
});
