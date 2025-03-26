import { Component, OnInit, inject } from '@angular/core';
import { HttpResponse } from '@angular/common/http';
import { ActivatedRoute } from '@angular/router';
import { Observable } from 'rxjs';
import { finalize } from 'rxjs/operators';

import SharedModule from 'app/shared/shared.module';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';

import { IParentOrganization } from '../parent-organization.model';
import { ParentOrganizationService } from '../service/parent-organization.service';
import { ParentOrganizationFormGroup, ParentOrganizationFormService } from './parent-organization-form.service';

@Component({
  selector: 'jhi-parent-organization-update',
  templateUrl: './parent-organization-update.component.html',
  imports: [SharedModule, FormsModule, ReactiveFormsModule],
})
export class ParentOrganizationUpdateComponent implements OnInit {
  isSaving = false;
  parentOrganization: IParentOrganization | null = null;

  protected parentOrganizationService = inject(ParentOrganizationService);
  protected parentOrganizationFormService = inject(ParentOrganizationFormService);
  protected activatedRoute = inject(ActivatedRoute);

  // eslint-disable-next-line @typescript-eslint/member-ordering
  editForm: ParentOrganizationFormGroup = this.parentOrganizationFormService.createParentOrganizationFormGroup();

  ngOnInit(): void {
    this.activatedRoute.data.subscribe(({ parentOrganization }) => {
      this.parentOrganization = parentOrganization;
      if (parentOrganization) {
        this.updateForm(parentOrganization);
      }
    });
  }

  previousState(): void {
    window.history.back();
  }

  save(): void {
    this.isSaving = true;
    const parentOrganization = this.parentOrganizationFormService.getParentOrganization(this.editForm);
    if (parentOrganization.id !== null) {
      this.subscribeToSaveResponse(this.parentOrganizationService.update(parentOrganization));
    } else {
      this.subscribeToSaveResponse(this.parentOrganizationService.create(parentOrganization));
    }
  }

  protected subscribeToSaveResponse(result: Observable<HttpResponse<IParentOrganization>>): void {
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

  protected updateForm(parentOrganization: IParentOrganization): void {
    this.parentOrganization = parentOrganization;
    this.parentOrganizationFormService.resetForm(this.editForm, parentOrganization);
  }
}
