import { Component, OnInit, inject } from '@angular/core';
import { HttpResponse } from '@angular/common/http';
import { ActivatedRoute } from '@angular/router';
import { Observable } from 'rxjs';
import { finalize, map } from 'rxjs/operators';

import SharedModule from 'app/shared/shared.module';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';

import { IAgentType } from 'app/entities/agent-type/agent-type.model';
import { AgentTypeService } from 'app/entities/agent-type/service/agent-type.service';
import { IOrganisation } from '../organisation.model';
import { OrganisationService } from '../service/organisation.service';
import { OrganisationFormGroup, OrganisationFormService } from './organisation-form.service';

@Component({
  selector: 'jhi-organisation-update',
  templateUrl: './organisation-update.component.html',
  imports: [SharedModule, FormsModule, ReactiveFormsModule],
})
export class OrganisationUpdateComponent implements OnInit {
  isSaving = false;
  organisation: IOrganisation | null = null;

  agentTypesSharedCollection: IAgentType[] = [];

  protected organisationService = inject(OrganisationService);
  protected organisationFormService = inject(OrganisationFormService);
  protected agentTypeService = inject(AgentTypeService);
  protected activatedRoute = inject(ActivatedRoute);

  // eslint-disable-next-line @typescript-eslint/member-ordering
  editForm: OrganisationFormGroup = this.organisationFormService.createOrganisationFormGroup();

  compareAgentType = (o1: IAgentType | null, o2: IAgentType | null): boolean => this.agentTypeService.compareAgentType(o1, o2);

  ngOnInit(): void {
    this.activatedRoute.data.subscribe(({ organisation }) => {
      this.organisation = organisation;
      if (organisation) {
        this.updateForm(organisation);
      }

      this.loadRelationshipsOptions();
    });
  }

  previousState(): void {
    window.history.back();
  }

  save(): void {
    this.isSaving = true;
    const organisation = this.organisationFormService.getOrganisation(this.editForm);
    if (organisation.id !== null) {
      this.subscribeToSaveResponse(this.organisationService.update(organisation));
    } else {
      this.subscribeToSaveResponse(this.organisationService.create(organisation));
    }
  }

  protected subscribeToSaveResponse(result: Observable<HttpResponse<IOrganisation>>): void {
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

  protected updateForm(organisation: IOrganisation): void {
    this.organisation = organisation;
    this.organisationFormService.resetForm(this.editForm, organisation);

    this.agentTypesSharedCollection = this.agentTypeService.addAgentTypeToCollectionIfMissing<IAgentType>(
      this.agentTypesSharedCollection,
      organisation.agentType,
    );
  }

  protected loadRelationshipsOptions(): void {
    this.agentTypeService
      .query()
      .pipe(map((res: HttpResponse<IAgentType[]>) => res.body ?? []))
      .pipe(
        map((agentTypes: IAgentType[]) =>
          this.agentTypeService.addAgentTypeToCollectionIfMissing<IAgentType>(agentTypes, this.organisation?.agentType),
        ),
      )
      .subscribe((agentTypes: IAgentType[]) => (this.agentTypesSharedCollection = agentTypes));
  }
}
