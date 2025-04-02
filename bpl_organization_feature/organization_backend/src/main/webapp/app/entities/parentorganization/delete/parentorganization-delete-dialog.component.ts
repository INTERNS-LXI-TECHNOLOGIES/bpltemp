import { Component, inject } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';

import SharedModule from 'app/shared/shared.module';
import { ITEM_DELETED_EVENT } from 'app/config/navigation.constants';
import { IParentorganization } from '../parentorganization.model';
import { ParentorganizationService } from '../service/parentorganization.service';

@Component({
  templateUrl: './parentorganization-delete-dialog.component.html',
  imports: [SharedModule, FormsModule],
})
export class ParentorganizationDeleteDialogComponent {
  parentorganization?: IParentorganization;

  protected parentorganizationService = inject(ParentorganizationService);
  protected activeModal = inject(NgbActiveModal);

  cancel(): void {
    this.activeModal.dismiss();
  }

  confirmDelete(id: number): void {
    this.parentorganizationService.delete(id).subscribe(() => {
      this.activeModal.close(ITEM_DELETED_EVENT);
    });
  }
}
