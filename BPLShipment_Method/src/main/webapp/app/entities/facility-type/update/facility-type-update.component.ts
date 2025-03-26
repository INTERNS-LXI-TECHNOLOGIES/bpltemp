import { Component, OnInit, inject } from '@angular/core';
import { HttpResponse } from '@angular/common/http';
import { ActivatedRoute } from '@angular/router';
import { Observable } from 'rxjs';
import { finalize } from 'rxjs/operators';

import SharedModule from 'app/shared/shared.module';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';

import { IFacilityType } from '../facility-type.model';
import { FacilityTypeService } from '../service/facility-type.service';
import { FacilityTypeFormGroup, FacilityTypeFormService } from './facility-type-form.service';

@Component({
  selector: 'jhi-facility-type-update',
  templateUrl: './facility-type-update.component.html',
  imports: [SharedModule, FormsModule, ReactiveFormsModule],
})
export class FacilityTypeUpdateComponent implements OnInit {
  isSaving = false;
  facilityType: IFacilityType | null = null;

  protected facilityTypeService = inject(FacilityTypeService);
  protected facilityTypeFormService = inject(FacilityTypeFormService);
  protected activatedRoute = inject(ActivatedRoute);

  // eslint-disable-next-line @typescript-eslint/member-ordering
  editForm: FacilityTypeFormGroup = this.facilityTypeFormService.createFacilityTypeFormGroup();

  ngOnInit(): void {
    this.activatedRoute.data.subscribe(({ facilityType }) => {
      this.facilityType = facilityType;
      if (facilityType) {
        this.updateForm(facilityType);
      }
    });
  }

  previousState(): void {
    window.history.back();
  }

  save(): void {
    this.isSaving = true;
    const facilityType = this.facilityTypeFormService.getFacilityType(this.editForm);
    if (facilityType.id !== null) {
      this.subscribeToSaveResponse(this.facilityTypeService.update(facilityType));
    } else {
      this.subscribeToSaveResponse(this.facilityTypeService.create(facilityType));
    }
  }

  protected subscribeToSaveResponse(result: Observable<HttpResponse<IFacilityType>>): void {
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

  protected updateForm(facilityType: IFacilityType): void {
    this.facilityType = facilityType;
    this.facilityTypeFormService.resetForm(this.editForm, facilityType);
  }
}
