import { Component, input } from '@angular/core';
import { RouterModule } from '@angular/router';

import SharedModule from 'app/shared/shared.module';
import { IAgentType } from '../agent-type.model';

@Component({
  selector: 'jhi-agent-type-detail',
  templateUrl: './agent-type-detail.component.html',
  imports: [SharedModule, RouterModule],
})
export class AgentTypeDetailComponent {
  agentType = input<IAgentType | null>(null);

  previousState(): void {
    window.history.back();
  }
}
