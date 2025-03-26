import { Component, OnInit, inject } from '@angular/core';
import { HttpResponse } from '@angular/common/http';
import { ActivatedRoute } from '@angular/router';
import { Observable } from 'rxjs';
import { finalize } from 'rxjs/operators';

import SharedModule from 'app/shared/shared.module';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';

import { IAgentType } from '../agent-type.model';
import { AgentTypeService } from '../service/agent-type.service';
import { AgentTypeFormGroup, AgentTypeFormService } from './agent-type-form.service';

@Component({
  selector: 'jhi-agent-type-update',
  templateUrl: './agent-type-update.component.html',
  imports: [SharedModule, FormsModule, ReactiveFormsModule],
})
export class AgentTypeUpdateComponent implements OnInit {
  isSaving = false;
  agentType: IAgentType | null = null;

  protected agentTypeService = inject(AgentTypeService);
  protected agentTypeFormService = inject(AgentTypeFormService);
  protected activatedRoute = inject(ActivatedRoute);

  // eslint-disable-next-line @typescript-eslint/member-ordering
  editForm: AgentTypeFormGroup = this.agentTypeFormService.createAgentTypeFormGroup();

  ngOnInit(): void {
    this.activatedRoute.data.subscribe(({ agentType }) => {
      this.agentType = agentType;
      if (agentType) {
        this.updateForm(agentType);
      }
    });
  }

  previousState(): void {
    window.history.back();
  }

  save(): void {
    this.isSaving = true;
    const agentType = this.agentTypeFormService.getAgentType(this.editForm);
    if (agentType.id !== null) {
      this.subscribeToSaveResponse(this.agentTypeService.update(agentType));
    } else {
      this.subscribeToSaveResponse(this.agentTypeService.create(agentType));
    }
  }

  protected subscribeToSaveResponse(result: Observable<HttpResponse<IAgentType>>): void {
    result.pipe(finalize(() => this.onSaveFinalize())).subscribe({
      next: () => this.onSaveSuccess(),
      error: () => this.onSaveError(),
    });
  }

  protected onSaveSuccess(): void {
    this.previousState();
  }

  protected onSaveError(): void {
    // Api for inheritance.
  }

  protected onSaveFinalize(): void {
    this.isSaving = false;
  }

  protected updateForm(agentType: IAgentType): void {
    this.agentType = agentType;
    this.agentTypeFormService.resetForm(this.editForm, agentType);
  }
}
