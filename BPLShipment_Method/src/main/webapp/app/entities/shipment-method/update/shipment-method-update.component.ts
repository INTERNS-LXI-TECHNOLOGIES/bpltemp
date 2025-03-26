import { Component, OnInit, inject } from '@angular/core';
import { HttpResponse } from '@angular/common/http';
import { ActivatedRoute } from '@angular/router';
import { Observable } from 'rxjs';
import { finalize, map } from 'rxjs/operators';

import SharedModule from 'app/shared/shared.module';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';

import { IFacilityType } from 'app/entities/facility-type/facility-type.model';
import { FacilityTypeService } from 'app/entities/facility-type/service/facility-type.service';
import { IShipmentMethod } from '../shipment-method.model';
import { ShipmentMethodService } from '../service/shipment-method.service';
import { ShipmentMethodFormGroup, ShipmentMethodFormService } from './shipment-method-form.service';

@Component({
  selector: 'jhi-shipment-method-update',
  templateUrl: './shipment-method-update.component.html',
  imports: [SharedModule, FormsModule, ReactiveFormsModule],
})
export class ShipmentMethodUpdateComponent implements OnInit {
  isSaving = false;
  shipmentMethod: IShipmentMethod | null = null;

  facilityTypesSharedCollection: IFacilityType[] = [];

  protected shipmentMethodService = inject(ShipmentMethodService);
  protected shipmentMethodFormService = inject(ShipmentMethodFormService);
  protected facilityTypeService = inject(FacilityTypeService);
  protected activatedRoute = inject(ActivatedRoute);

  // eslint-disable-next-line @typescript-eslint/member-ordering
  editForm: ShipmentMethodFormGroup = this.shipmentMethodFormService.createShipmentMethodFormGroup();

  compareFacilityType = (o1: IFacilityType | null, o2: IFacilityType | null): boolean =>
    this.facilityTypeService.compareFacilityType(o1, o2);

  ngOnInit(): void {
    this.activatedRoute.data.subscribe(({ shipmentMethod }) => {
      this.shipmentMethod = shipmentMethod;
      if (shipmentMethod) {
        this.updateForm(shipmentMethod);
      }

      this.loadRelationshipsOptions();
    });
  }

  previousState(): void {
    window.history.back();
  }

  save(): void {
    this.isSaving = true;
    const shipmentMethod = this.shipmentMethodFormService.getShipmentMethod(this.editForm);
    if (shipmentMethod.id !== null) {
      this.subscribeToSaveResponse(this.shipmentMethodService.update(shipmentMethod));
    } else {
      this.subscribeToSaveResponse(this.shipmentMethodService.create(shipmentMethod));
    }
  }

  protected subscribeToSaveResponse(result: Observable<HttpResponse<IShipmentMethod>>): void {
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

  protected updateForm(shipmentMethod: IShipmentMethod): void {
    this.shipmentMethod = shipmentMethod;
    this.shipmentMethodFormService.resetForm(this.editForm, shipmentMethod);

    this.facilityTypesSharedCollection = this.facilityTypeService.addFacilityTypeToCollectionIfMissing<IFacilityType>(
      this.facilityTypesSharedCollection,
      shipmentMethod.parentType,
    );
  }

  protected loadRelationshipsOptions(): void {
    this.facilityTypeService
      .query()
      .pipe(map((res: HttpResponse<IFacilityType[]>) => res.body ?? []))
      .pipe(
        map((facilityTypes: IFacilityType[]) =>
          this.facilityTypeService.addFacilityTypeToCollectionIfMissing<IFacilityType>(facilityTypes, this.shipmentMethod?.parentType),
        ),
      )
      .subscribe((facilityTypes: IFacilityType[]) => (this.facilityTypesSharedCollection = facilityTypes));
  }
}
