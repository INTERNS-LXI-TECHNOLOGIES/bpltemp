import { Component, inject } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';

import SharedModule from 'app/shared/shared.module';
import { ITEM_DELETED_EVENT } from 'app/config/navigation.constants';
import { IParentOrganization } from '../parent-organization.model';
import { ParentOrganizationService } from '../service/parent-organization.service';

@Component({
  templateUrl: './parent-organization-delete-dialog.component.html',
  imports: [SharedModule, FormsModule],
})
export class ParentOrganizationDeleteDialogComponent {
  parentOrganization?: IParentOrganization;

  protected parentOrganizationService = inject(ParentOrganizationService);
  protected activeModal = inject(NgbActiveModal);

  cancel(): void {
    this.activeModal.dismiss();
  }

  confirmDelete(id: number): void {
    this.parentOrganizationService.delete(id).subscribe(() => {
      this.activeModal.close(ITEM_DELETED_EVENT);
    });
  }
}
