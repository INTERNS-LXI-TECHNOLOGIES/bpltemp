import { Component, OnInit, inject } from '@angular/core';
import { HttpResponse } from '@angular/common/http';
import { ActivatedRoute } from '@angular/router';
import { Observable } from 'rxjs';
import { finalize, map } from 'rxjs/operators';

import SharedModule from 'app/shared/shared.module';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';

import { IParentOrganization } from 'app/entities/parent-organization/parent-organization.model';
import { ParentOrganizationService } from 'app/entities/parent-organization/service/parent-organization.service';
import { IOrganization } from '../organization.model';
import { OrganizationService } from '../service/organization.service';
import { OrganizationFormGroup, OrganizationFormService } from './organization-form.service';

@Component({
  selector: 'jhi-organization-update',
  templateUrl: './organization-update.component.html',
  imports: [SharedModule, FormsModule, ReactiveFormsModule],
})
export class OrganizationUpdateComponent implements OnInit {
  isSaving = false;
  organization: IOrganization | null = null;

  parentOrganizationsCollection: IParentOrganization[] = [];

  protected organizationService = inject(OrganizationService);
  protected organizationFormService = inject(OrganizationFormService);
  protected parentOrganizationService = inject(ParentOrganizationService);
  protected activatedRoute = inject(ActivatedRoute);

  // eslint-disable-next-line @typescript-eslint/member-ordering
  editForm: OrganizationFormGroup = this.organizationFormService.createOrganizationFormGroup();

  compareParentOrganization = (o1: IParentOrganization | null, o2: IParentOrganization | null): boolean =>
    this.parentOrganizationService.compareParentOrganization(o1, o2);

  ngOnInit(): void {
    this.activatedRoute.data.subscribe(({ organization }) => {
      this.organization = organization;
      if (organization) {
        this.updateForm(organization);
      }

      this.loadRelationshipsOptions();
    });
  }

  previousState(): void {
    window.history.back();
  }

  save(): void {
    this.isSaving = true;
    const organization = this.organizationFormService.getOrganization(this.editForm);
    if (organization.id !== null) {
      this.subscribeToSaveResponse(this.organizationService.update(organization));
    } else {
      this.subscribeToSaveResponse(this.organizationService.create(organization));
    }
  }

  protected subscribeToSaveResponse(result: Observable<HttpResponse<IOrganization>>): void {
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

  protected updateForm(organization: IOrganization): void {
    this.organization = organization;
    this.organizationFormService.resetForm(this.editForm, organization);

    this.parentOrganizationsCollection = this.parentOrganizationService.addParentOrganizationToCollectionIfMissing<IParentOrganization>(
      this.parentOrganizationsCollection,
      organization.parentOrganization,
    );
  }

  protected loadRelationshipsOptions(): void {
    this.parentOrganizationService
      .query({ filter: 'organization-is-null' })
      .pipe(map((res: HttpResponse<IParentOrganization[]>) => res.body ?? []))
      .pipe(
        map((parentOrganizations: IParentOrganization[]) =>
          this.parentOrganizationService.addParentOrganizationToCollectionIfMissing<IParentOrganization>(
            parentOrganizations,
            this.organization?.parentOrganization,
          ),
        ),
      )
      .subscribe((parentOrganizations: IParentOrganization[]) => (this.parentOrganizationsCollection = parentOrganizations));
  }
}
