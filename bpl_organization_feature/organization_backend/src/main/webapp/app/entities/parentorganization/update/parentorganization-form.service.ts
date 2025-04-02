import { Injectable } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';

import { IParentorganization, NewParentorganization } from '../parentorganization.model';

/**
 * A partial Type with required key is used as form input.
 */
type PartialWithRequiredKeyOf<T extends { id: unknown }> = Partial<Omit<T, 'id'>> & { id: T['id'] };

/**
 * Type for createFormGroup and resetForm argument.
 * It accepts IParentorganization for edit and NewParentorganizationFormGroupInput for create.
 */
type ParentorganizationFormGroupInput = IParentorganization | PartialWithRequiredKeyOf<NewParentorganization>;

type ParentorganizationFormDefaults = Pick<NewParentorganization, 'id'>;

type ParentorganizationFormGroupContent = {
  id: FormControl<IParentorganization['id'] | NewParentorganization['id']>;
  name: FormControl<IParentorganization['name']>;
  description: FormControl<IParentorganization['description']>;
};

export type ParentorganizationFormGroup = FormGroup<ParentorganizationFormGroupContent>;

@Injectable({ providedIn: 'root' })
export class ParentorganizationFormService {
  createParentorganizationFormGroup(parentorganization: ParentorganizationFormGroupInput = { id: null }): ParentorganizationFormGroup {
    const parentorganizationRawValue = {
      ...this.getFormDefaults(),
      ...parentorganization,
    };
    return new FormGroup<ParentorganizationFormGroupContent>({
      id: new FormControl(
        { value: parentorganizationRawValue.id, disabled: true },
        {
          nonNullable: true,
          validators: [Validators.required],
        },
      ),
      name: new FormControl(parentorganizationRawValue.name),
      description: new FormControl(parentorganizationRawValue.description),
    });
  }

  getParentorganization(form: ParentorganizationFormGroup): IParentorganization | NewParentorganization {
    return form.getRawValue() as IParentorganization | NewParentorganization;
  }

  resetForm(form: ParentorganizationFormGroup, parentorganization: ParentorganizationFormGroupInput): void {
    const parentorganizationRawValue = { ...this.getFormDefaults(), ...parentorganization };
    form.reset(
      {
        ...parentorganizationRawValue,
        id: { value: parentorganizationRawValue.id, disabled: true },
      } as any /* cast to workaround https://github.com/angular/angular/issues/46458 */,
    );
  }

  private getFormDefaults(): ParentorganizationFormDefaults {
    return {
      id: null,
    };
  }
}
