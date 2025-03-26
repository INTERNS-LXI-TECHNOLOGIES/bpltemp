import { Injectable } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';

import { IShipmentMethod, NewShipmentMethod } from '../shipment-method.model';

/**
 * A partial Type with required key is used as form input.
 */
type PartialWithRequiredKeyOf<T extends { id: unknown }> = Partial<Omit<T, 'id'>> & { id: T['id'] };

/**
 * Type for createFormGroup and resetForm argument.
 * It accepts IShipmentMethod for edit and NewShipmentMethodFormGroupInput for create.
 */
type ShipmentMethodFormGroupInput = IShipmentMethod | PartialWithRequiredKeyOf<NewShipmentMethod>;

type ShipmentMethodFormDefaults = Pick<NewShipmentMethod, 'id'>;

type ShipmentMethodFormGroupContent = {
  id: FormControl<IShipmentMethod['id'] | NewShipmentMethod['id']>;
  name: FormControl<IShipmentMethod['name']>;
  description: FormControl<IShipmentMethod['description']>;
  parentType: FormControl<IShipmentMethod['parentType']>;
};

export type ShipmentMethodFormGroup = FormGroup<ShipmentMethodFormGroupContent>;

@Injectable({ providedIn: 'root' })
export class ShipmentMethodFormService {
  createShipmentMethodFormGroup(shipmentMethod: ShipmentMethodFormGroupInput = { id: null }): ShipmentMethodFormGroup {
    const shipmentMethodRawValue = {
      ...this.getFormDefaults(),
      ...shipmentMethod,
    };
    return new FormGroup<ShipmentMethodFormGroupContent>({
      id: new FormControl(
        { value: shipmentMethodRawValue.id, disabled: true },
        {
          nonNullable: true,
          validators: [Validators.required],
        },
      ),
      name: new FormControl(shipmentMethodRawValue.name, {
        validators: [Validators.required, Validators.maxLength(100)],
      }),
      description: new FormControl(shipmentMethodRawValue.description, {
        validators: [Validators.maxLength(255)],
      }),
      parentType: new FormControl(shipmentMethodRawValue.parentType),
    });
  }

  getShipmentMethod(form: ShipmentMethodFormGroup): IShipmentMethod | NewShipmentMethod {
    return form.getRawValue() as IShipmentMethod | NewShipmentMethod;
  }

  resetForm(form: ShipmentMethodFormGroup, shipmentMethod: ShipmentMethodFormGroupInput): void {
    const shipmentMethodRawValue = { ...this.getFormDefaults(), ...shipmentMethod };
    form.reset(
      {
        ...shipmentMethodRawValue,
        id: { value: shipmentMethodRawValue.id, disabled: true },
      } as any /* cast to workaround https://github.com/angular/angular/issues/46458 */,
    );
  }

  private getFormDefaults(): ShipmentMethodFormDefaults {
    return {
      id: null,
    };
  }
}
