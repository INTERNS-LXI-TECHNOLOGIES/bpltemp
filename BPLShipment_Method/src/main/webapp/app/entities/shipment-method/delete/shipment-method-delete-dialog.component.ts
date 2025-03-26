import { Component, inject } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';

import SharedModule from 'app/shared/shared.module';
import { ITEM_DELETED_EVENT } from 'app/config/navigation.constants';
import { IShipmentMethod } from '../shipment-method.model';
import { ShipmentMethodService } from '../service/shipment-method.service';

@Component({
  templateUrl: './shipment-method-delete-dialog.component.html',
  imports: [SharedModule, FormsModule],
})
export class ShipmentMethodDeleteDialogComponent {
  shipmentMethod?: IShipmentMethod;

  protected shipmentMethodService = inject(ShipmentMethodService);
  protected activeModal = inject(NgbActiveModal);

  cancel(): void {
    this.activeModal.dismiss();
  }

  confirmDelete(id: number): void {
    this.shipmentMethodService.delete(id).subscribe(() => {
      this.activeModal.close(ITEM_DELETED_EVENT);
    });
  }
}
