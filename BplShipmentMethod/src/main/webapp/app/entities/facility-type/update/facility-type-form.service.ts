import { Injectable } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';

import { IFacilityType, NewFacilityType } from '../facility-type.model';

/**
 * A partial Type with required key is used as form input.
 */
type PartialWithRequiredKeyOf<T extends { id: unknown }> = Partial<Omit<T, 'id'>> & { id: T['id'] };

/**
 * Type for createFormGroup and resetForm argument.
 * It accepts IFacilityType for edit and NewFacilityTypeFormGroupInput for create.
 */
type FacilityTypeFormGroupInput = IFacilityType | PartialWithRequiredKeyOf<NewFacilityType>;

type FacilityTypeFormDefaults = Pick<NewFacilityType, 'id'>;

type FacilityTypeFormGroupContent = {
  id: FormControl<IFacilityType['id'] | NewFacilityType['id']>;
  name: FormControl<IFacilityType['name']>;
};

export type FacilityTypeFormGroup = FormGroup<FacilityTypeFormGroupContent>;

@Injectable({ providedIn: 'root' })
export class FacilityTypeFormService {
  createFacilityTypeFormGroup(facilityType: FacilityTypeFormGroupInput = { id: null }): FacilityTypeFormGroup {
    const facilityTypeRawValue = {
      ...this.getFormDefaults(),
      ...facilityType,
    };
    return new FormGroup<FacilityTypeFormGroupContent>({
      id: new FormControl(
        { value: facilityTypeRawValue.id, disabled: true },
        {
          nonNullable: true,
          validators: [Validators.required],
        },
      ),
      name: new FormControl(facilityTypeRawValue.name, {
        validators: [Validators.required, Validators.maxLength(100)],
      }),
    });
  }

  getFacilityType(form: FacilityTypeFormGroup): IFacilityType | NewFacilityType {
    return form.getRawValue() as IFacilityType | NewFacilityType;
  }

  resetForm(form: FacilityTypeFormGroup, facilityType: FacilityTypeFormGroupInput): void {
    const facilityTypeRawValue = { ...this.getFormDefaults(), ...facilityType };
    form.reset(
      {
        ...facilityTypeRawValue,
        id: { value: facilityTypeRawValue.id, disabled: true },
      } as any /* cast to workaround https://github.com/angular/angular/issues/46458 */,
    );
  }

  private getFormDefaults(): FacilityTypeFormDefaults {
    return {
      id: null,
    };
  }
}
