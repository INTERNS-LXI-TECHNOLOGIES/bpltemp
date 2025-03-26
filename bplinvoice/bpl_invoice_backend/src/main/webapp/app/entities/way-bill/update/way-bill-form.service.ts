import { Injectable } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';

import dayjs from 'dayjs/esm';
import { DATE_TIME_FORMAT } from 'app/config/input.constants';
import { IWayBill, NewWayBill } from '../way-bill.model';

/**
 * A partial Type with required key is used as form input.
 */
type PartialWithRequiredKeyOf<T extends { id: unknown }> = Partial<Omit<T, 'id'>> & { id: T['id'] };

/**
 * Type for createFormGroup and resetForm argument.
 * It accepts IWayBill for edit and NewWayBillFormGroupInput for create.
 */
type WayBillFormGroupInput = IWayBill | PartialWithRequiredKeyOf<NewWayBill>;

/**
 * Type that converts some properties for forms.
 */
type FormValueOf<T extends IWayBill | NewWayBill> = Omit<T, 'estimatedReadyDate' | 'estimatedShipDate'> & {
  estimatedReadyDate?: string | null;
  estimatedShipDate?: string | null;
};

type WayBillFormRawValue = FormValueOf<IWayBill>;

type NewWayBillFormRawValue = FormValueOf<NewWayBill>;

type WayBillFormDefaults = Pick<NewWayBill, 'id' | 'estimatedReadyDate' | 'estimatedShipDate'>;

type WayBillFormGroupContent = {
  id: FormControl<WayBillFormRawValue['id'] | NewWayBill['id']>;
  boxLimit: FormControl<WayBillFormRawValue['boxLimit']>;
  shipmentType: FormControl<WayBillFormRawValue['shipmentType']>;
  opfac: FormControl<WayBillFormRawValue['opfac']>;
  deliveryAgent: FormControl<WayBillFormRawValue['deliveryAgent']>;
  estimatedReadyDate: FormControl<WayBillFormRawValue['estimatedReadyDate']>;
  currencyUom: FormControl<WayBillFormRawValue['currencyUom']>;
  estimatedShipDate: FormControl<WayBillFormRawValue['estimatedShipDate']>;
  status: FormControl<WayBillFormRawValue['status']>;
  referenceNumber: FormControl<WayBillFormRawValue['referenceNumber']>;
  currencyType: FormControl<WayBillFormRawValue['currencyType']>;
};

export type WayBillFormGroup = FormGroup<WayBillFormGroupContent>;

@Injectable({ providedIn: 'root' })
export class WayBillFormService {
  createWayBillFormGroup(wayBill: WayBillFormGroupInput = { id: null }): WayBillFormGroup {
    const wayBillRawValue = this.convertWayBillToWayBillRawValue({
      ...this.getFormDefaults(),
      ...wayBill,
    });
    return new FormGroup<WayBillFormGroupContent>({
      id: new FormControl(
        { value: wayBillRawValue.id, disabled: true },
        {
          nonNullable: true,
          validators: [Validators.required],
        },
      ),
      boxLimit: new FormControl(wayBillRawValue.boxLimit),
      shipmentType: new FormControl(wayBillRawValue.shipmentType),
      opfac: new FormControl(wayBillRawValue.opfac),
      deliveryAgent: new FormControl(wayBillRawValue.deliveryAgent),
      estimatedReadyDate: new FormControl(wayBillRawValue.estimatedReadyDate),
      currencyUom: new FormControl(wayBillRawValue.currencyUom),
      estimatedShipDate: new FormControl(wayBillRawValue.estimatedShipDate),
      status: new FormControl(wayBillRawValue.status),
      referenceNumber: new FormControl(wayBillRawValue.referenceNumber),
      currencyType: new FormControl(wayBillRawValue.currencyType),
    });
  }

  getWayBill(form: WayBillFormGroup): IWayBill | NewWayBill {
    return this.convertWayBillRawValueToWayBill(form.getRawValue() as WayBillFormRawValue | NewWayBillFormRawValue);
  }

  resetForm(form: WayBillFormGroup, wayBill: WayBillFormGroupInput): void {
    const wayBillRawValue = this.convertWayBillToWayBillRawValue({ ...this.getFormDefaults(), ...wayBill });
    form.reset(
      {
        ...wayBillRawValue,
        id: { value: wayBillRawValue.id, disabled: true },
      } as any /* cast to workaround https://github.com/angular/angular/issues/46458 */,
    );
  }

  private getFormDefaults(): WayBillFormDefaults {
    const currentTime = dayjs();

    return {
      id: null,
      estimatedReadyDate: currentTime,
      estimatedShipDate: currentTime,
    };
  }

  private convertWayBillRawValueToWayBill(rawWayBill: WayBillFormRawValue | NewWayBillFormRawValue): IWayBill | NewWayBill {
    return {
      ...rawWayBill,
      estimatedReadyDate: dayjs(rawWayBill.estimatedReadyDate, DATE_TIME_FORMAT),
      estimatedShipDate: dayjs(rawWayBill.estimatedShipDate, DATE_TIME_FORMAT),
    };
  }

  private convertWayBillToWayBillRawValue(
    wayBill: IWayBill | (Partial<NewWayBill> & WayBillFormDefaults),
  ): WayBillFormRawValue | PartialWithRequiredKeyOf<NewWayBillFormRawValue> {
    return {
      ...wayBill,
      estimatedReadyDate: wayBill.estimatedReadyDate ? wayBill.estimatedReadyDate.format(DATE_TIME_FORMAT) : undefined,
      estimatedShipDate: wayBill.estimatedShipDate ? wayBill.estimatedShipDate.format(DATE_TIME_FORMAT) : undefined,
    };
  }
}
