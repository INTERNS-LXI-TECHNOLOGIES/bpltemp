import { Component, inject } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';

import SharedModule from 'app/shared/shared.module';
import { ITEM_DELETED_EVENT } from 'app/config/navigation.constants';
import { ICurrencyType } from '../currency-type.model';
import { CurrencyTypeService } from '../service/currency-type.service';

@Component({
  templateUrl: './currency-type-delete-dialog.component.html',
  imports: [SharedModule, FormsModule],
})
export class CurrencyTypeDeleteDialogComponent {
  currencyType?: ICurrencyType;

  protected currencyTypeService = inject(CurrencyTypeService);
  protected activeModal = inject(NgbActiveModal);

  cancel(): void {
    this.activeModal.dismiss();
  }

  confirmDelete(id: number): void {
    this.currencyTypeService.delete(id).subscribe(() => {
      this.activeModal.close(ITEM_DELETED_EVENT);
    });
  }
}
