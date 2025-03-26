import { Injectable } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';

import { IParentOrganization, NewParentOrganization } from '../parent-organization.model';

/**
 * A partial Type with required key is used as form input.
 */
type PartialWithRequiredKeyOf<T extends { id: unknown }> = Partial<Omit<T, 'id'>> & { id: T['id'] };

/**
 * Type for createFormGroup and resetForm argument.
 * It accepts IParentOrganization for edit and NewParentOrganizationFormGroupInput for create.
 */
type ParentOrganizationFormGroupInput = IParentOrganization | PartialWithRequiredKeyOf<NewParentOrganization>;

type ParentOrganizationFormDefaults = Pick<NewParentOrganization, 'id'>;

type ParentOrganizationFormGroupContent = {
  id: FormControl<IParentOrganization['id'] | NewParentOrganization['id']>;
  name: FormControl<IParentOrganization['name']>;
};

export type ParentOrganizationFormGroup = FormGroup<ParentOrganizationFormGroupContent>;

@Injectable({ providedIn: 'root' })
export class ParentOrganizationFormService {
  createParentOrganizationFormGroup(parentOrganization: ParentOrganizationFormGroupInput = { id: null }): ParentOrganizationFormGroup {
    const parentOrganizationRawValue = {
      ...this.getFormDefaults(),
      ...parentOrganization,
    };
    return new FormGroup<ParentOrganizationFormGroupContent>({
      id: new FormControl(
        { value: parentOrganizationRawValue.id, disabled: true },
        {
          nonNullable: true,
          validators: [Validators.required],
        },
      ),
      name: new FormControl(parentOrganizationRawValue.name, {
        validators: [Validators.required],
      }),
    });
  }

  getParentOrganization(form: ParentOrganizationFormGroup): IParentOrganization | NewParentOrganization {
    return form.getRawValue() as IParentOrganization | NewParentOrganization;
  }

  resetForm(form: ParentOrganizationFormGroup, parentOrganization: ParentOrganizationFormGroupInput): void {
    const parentOrganizationRawValue = { ...this.getFormDefaults(), ...parentOrganization };
    form.reset(
      {
        ...parentOrganizationRawValue,
        id: { value: parentOrganizationRawValue.id, disabled: true },
      } as any /* cast to workaround https://github.com/angular/angular/issues/46458 */,
    );
  }

  private getFormDefaults(): ParentOrganizationFormDefaults {
    return {
      id: null,
    };
  }
}
