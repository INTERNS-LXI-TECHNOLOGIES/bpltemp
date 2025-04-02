import { Component, OnInit, inject } from '@angular/core';
import { HttpResponse } from '@angular/common/http';
import { ActivatedRoute } from '@angular/router';
import { Observable } from 'rxjs';
import { finalize } from 'rxjs/operators';

import SharedModule from 'app/shared/shared.module';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';

import { IParentorganization } from '../parentorganization.model';
import { ParentorganizationService } from '../service/parentorganization.service';
import { ParentorganizationFormGroup, ParentorganizationFormService } from './parentorganization-form.service';

@Component({
  selector: 'jhi-parentorganization-update',
  templateUrl: './parentorganization-update.component.html',
  imports: [SharedModule, FormsModule, ReactiveFormsModule],
})
export class ParentorganizationUpdateComponent implements OnInit {
  isSaving = false;
  parentorganization: IParentorganization | null = null;

  protected parentorganizationService = inject(ParentorganizationService);
  protected parentorganizationFormService = inject(ParentorganizationFormService);
  protected activatedRoute = inject(ActivatedRoute);

  // eslint-disable-next-line @typescript-eslint/member-ordering
  editForm: ParentorganizationFormGroup = this.parentorganizationFormService.createParentorganizationFormGroup();

  ngOnInit(): void {
    this.activatedRoute.data.subscribe(({ parentorganization }) => {
      this.parentorganization = parentorganization;
      if (parentorganization) {
        this.updateForm(parentorganization);
      }
    });
  }

  previousState(): void {
    window.history.back();
  }

  save(): void {
    this.isSaving = true;
    const parentorganization = this.parentorganizationFormService.getParentorganization(this.editForm);
    if (parentorganization.id !== null) {
      this.subscribeToSaveResponse(this.parentorganizationService.update(parentorganization));
    } else {
      this.subscribeToSaveResponse(this.parentorganizationService.create(parentorganization));
    }
  }

  protected subscribeToSaveResponse(result: Observable<HttpResponse<IParentorganization>>): void {
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

  protected updateForm(parentorganization: IParentorganization): void {
    this.parentorganization = parentorganization;
    this.parentorganizationFormService.resetForm(this.editForm, parentorganization);
  }
}
