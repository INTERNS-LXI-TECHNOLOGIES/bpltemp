import { Component, OnInit, inject } from '@angular/core';
import { HttpResponse } from '@angular/common/http';
import { ActivatedRoute } from '@angular/router';
import { Observable } from 'rxjs';
import { finalize, map } from 'rxjs/operators';

import SharedModule from 'app/shared/shared.module';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';

import { ICurrencyType } from 'app/entities/currency-type/currency-type.model';
import { CurrencyTypeService } from 'app/entities/currency-type/service/currency-type.service';
import { IWayBill } from '../way-bill.model';
import { WayBillService } from '../service/way-bill.service';
import { WayBillFormGroup, WayBillFormService } from './way-bill-form.service';

@Component({
  selector: 'jhi-way-bill-update',
  templateUrl: './way-bill-update.component.html',
  imports: [SharedModule, FormsModule, ReactiveFormsModule],
})
export class WayBillUpdateComponent implements OnInit {
  isSaving = false;
  wayBill: IWayBill | null = null;

  currencyTypesCollection: ICurrencyType[] = [];

  protected wayBillService = inject(WayBillService);
  protected wayBillFormService = inject(WayBillFormService);
  protected currencyTypeService = inject(CurrencyTypeService);
  protected activatedRoute = inject(ActivatedRoute);

  // eslint-disable-next-line @typescript-eslint/member-ordering
  editForm: WayBillFormGroup = this.wayBillFormService.createWayBillFormGroup();

  compareCurrencyType = (o1: ICurrencyType | null, o2: ICurrencyType | null): boolean =>
    this.currencyTypeService.compareCurrencyType(o1, o2);

  ngOnInit(): void {
    this.activatedRoute.data.subscribe(({ wayBill }) => {
      this.wayBill = wayBill;
      if (wayBill) {
        this.updateForm(wayBill);
      }

      this.loadRelationshipsOptions();
    });
  }

  previousState(): void {
    window.history.back();
  }

  save(): void {
    this.isSaving = true;
    const wayBill = this.wayBillFormService.getWayBill(this.editForm);
    if (wayBill.id !== null) {
      this.subscribeToSaveResponse(this.wayBillService.update(wayBill));
    } else {
      this.subscribeToSaveResponse(this.wayBillService.create(wayBill));
    }
  }

  protected subscribeToSaveResponse(result: Observable<HttpResponse<IWayBill>>): void {
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

  protected updateForm(wayBill: IWayBill): void {
    this.wayBill = wayBill;
    this.wayBillFormService.resetForm(this.editForm, wayBill);

    this.currencyTypesCollection = this.currencyTypeService.addCurrencyTypeToCollectionIfMissing<ICurrencyType>(
      this.currencyTypesCollection,
      wayBill.currencyType,
    );
  }

  protected loadRelationshipsOptions(): void {
    this.currencyTypeService
      .query({ filter: 'waybill-is-null' })
      .pipe(map((res: HttpResponse<ICurrencyType[]>) => res.body ?? []))
      .pipe(
        map((currencyTypes: ICurrencyType[]) =>
          this.currencyTypeService.addCurrencyTypeToCollectionIfMissing<ICurrencyType>(currencyTypes, this.wayBill?.currencyType),
        ),
      )
      .subscribe((currencyTypes: ICurrencyType[]) => (this.currencyTypesCollection = currencyTypes));
  }
}
