import { Injectable } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';

import { IAgentType, NewAgentType } from '../agent-type.model';

/**
 * A partial Type with required key is used as form input.
 */
type PartialWithRequiredKeyOf<T extends { id: unknown }> = Partial<Omit<T, 'id'>> & { id: T['id'] };

/**
 * Type for createFormGroup and resetForm argument.
 * It accepts IAgentType for edit and NewAgentTypeFormGroupInput for create.
 */
type AgentTypeFormGroupInput = IAgentType | PartialWithRequiredKeyOf<NewAgentType>;

type AgentTypeFormDefaults = Pick<NewAgentType, 'id'>;

type AgentTypeFormGroupContent = {
  id: FormControl<IAgentType['id'] | NewAgentType['id']>;
  name: FormControl<IAgentType['name']>;
  description: FormControl<IAgentType['description']>;
};

export type AgentTypeFormGroup = FormGroup<AgentTypeFormGroupContent>;

@Injectable({ providedIn: 'root' })
export class AgentTypeFormService {
  createAgentTypeFormGroup(agentType: AgentTypeFormGroupInput = { id: null }): AgentTypeFormGroup {
    const agentTypeRawValue = {
      ...this.getFormDefaults(),
      ...agentType,
    };
    return new FormGroup<AgentTypeFormGroupContent>({
      id: new FormControl(
        { value: agentTypeRawValue.id, disabled: true },
        {
          nonNullable: true,
          validators: [Validators.required],
        },
      ),
      name: new FormControl(agentTypeRawValue.name, {
        validators: [Validators.required],
      }),
      description: new FormControl(agentTypeRawValue.description),
    });
  }

  getAgentType(form: AgentTypeFormGroup): IAgentType | NewAgentType {
    return form.getRawValue() as IAgentType | NewAgentType;
  }

  resetForm(form: AgentTypeFormGroup, agentType: AgentTypeFormGroupInput): void {
    const agentTypeRawValue = { ...this.getFormDefaults(), ...agentType };
    form.reset(
      {
        ...agentTypeRawValue,
        id: { value: agentTypeRawValue.id, disabled: true },
      } as any /* cast to workaround https://github.com/angular/angular/issues/46458 */,
    );
  }

  private getFormDefaults(): AgentTypeFormDefaults {
    return {
      id: null,
    };
  }
}
