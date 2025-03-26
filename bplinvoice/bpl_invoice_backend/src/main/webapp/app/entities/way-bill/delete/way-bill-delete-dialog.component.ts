import { Component, inject } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';

import SharedModule from 'app/shared/shared.module';
import { ITEM_DELETED_EVENT } from 'app/config/navigation.constants';
import { IWayBill } from '../way-bill.model';
import { WayBillService } from '../service/way-bill.service';

@Component({
  templateUrl: './way-bill-delete-dialog.component.html',
  imports: [SharedModule, FormsModule],
})
export class WayBillDeleteDialogComponent {
  wayBill?: IWayBill;

  protected wayBillService = inject(WayBillService);
  protected activeModal = inject(NgbActiveModal);

  cancel(): void {
    this.activeModal.dismiss();
  }

  confirmDelete(id: number): void {
    this.wayBillService.delete(id).subscribe(() => {
      this.activeModal.close(ITEM_DELETED_EVENT);
    });
  }
}
