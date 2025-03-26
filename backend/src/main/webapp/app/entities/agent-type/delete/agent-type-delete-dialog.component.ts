import { Component, inject } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';

import SharedModule from 'app/shared/shared.module';
import { ITEM_DELETED_EVENT } from 'app/config/navigation.constants';
import { IAgentType } from '../agent-type.model';
import { AgentTypeService } from '../service/agent-type.service';

@Component({
  templateUrl: './agent-type-delete-dialog.component.html',
  imports: [SharedModule, FormsModule],
})
export class AgentTypeDeleteDialogComponent {
  agentType?: IAgentType;

  protected agentTypeService = inject(AgentTypeService);
  protected activeModal = inject(NgbActiveModal);

  cancel(): void {
    this.activeModal.dismiss();
  }

  confirmDelete(id: number): void {
    this.agentTypeService.delete(id).subscribe(() => {
      this.activeModal.close(ITEM_DELETED_EVENT);
    });
  }
}
