import { Component, inject } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';

import SharedModule from 'app/shared/shared.module';
import { ITEM_DELETED_EVENT } from 'app/config/navigation.constants';
import { IFacilityType } from '../facility-type.model';
import { FacilityTypeService } from '../service/facility-type.service';

@Component({
  templateUrl: './facility-type-delete-dialog.component.html',
  imports: [SharedModule, FormsModule],
})
export class FacilityTypeDeleteDialogComponent {
  facilityType?: IFacilityType;

  protected facilityTypeService = inject(FacilityTypeService);
  protected activeModal = inject(NgbActiveModal);

  cancel(): void {
    this.activeModal.dismiss();
  }

  confirmDelete(id: number): void {
    this.facilityTypeService.delete(id).subscribe(() => {
      this.activeModal.close(ITEM_DELETED_EVENT);
    });
  }
}
