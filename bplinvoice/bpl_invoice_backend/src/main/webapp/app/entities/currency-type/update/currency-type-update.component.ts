import { Component, OnInit, inject } from '@angular/core';
import { HttpResponse } from '@angular/common/http';
import { ActivatedRoute } from '@angular/router';
import { Observable } from 'rxjs';
import { finalize } from 'rxjs/operators';

import SharedModule from 'app/shared/shared.module';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';

import { ICurrencyType } from '../currency-type.model';
import { CurrencyTypeService } from '../service/currency-type.service';
import { CurrencyTypeFormGroup, CurrencyTypeFormService } from './currency-type-form.service';

@Component({
  selector: 'jhi-currency-type-update',
  templateUrl: './currency-type-update.component.html',
  imports: [SharedModule, FormsModule, ReactiveFormsModule],
})
export class CurrencyTypeUpdateComponent implements OnInit {
  isSaving = false;
  currencyType: ICurrencyType | null = null;

  protected currencyTypeService = inject(CurrencyTypeService);
  protected currencyTypeFormService = inject(CurrencyTypeFormService);
  protected activatedRoute = inject(ActivatedRoute);

  // eslint-disable-next-line @typescript-eslint/member-ordering
  editForm: CurrencyTypeFormGroup = this.currencyTypeFormService.createCurrencyTypeFormGroup();

  ngOnInit(): void {
    this.activatedRoute.data.subscribe(({ currencyType }) => {
      this.currencyType = currencyType;
      if (currencyType) {
        this.updateForm(currencyType);
      }
    });
  }

  previousState(): void {
    window.history.back();
  }

  save(): void {
    this.isSaving = true;
    const currencyType = this.currencyTypeFormService.getCurrencyType(this.editForm);
    if (currencyType.id !== null) {
      this.subscribeToSaveResponse(this.currencyTypeService.update(currencyType));
    } else {
      this.subscribeToSaveResponse(this.currencyTypeService.create(currencyType));
    }
  }

  protected subscribeToSaveResponse(result: Observable<HttpResponse<ICurrencyType>>): void {
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

  protected updateForm(currencyType: ICurrencyType): void {
    this.currencyType = currencyType;
    this.currencyTypeFormService.resetForm(this.editForm, currencyType);
  }
}
