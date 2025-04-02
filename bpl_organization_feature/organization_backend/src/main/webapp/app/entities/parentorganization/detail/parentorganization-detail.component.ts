import { Component, input } from '@angular/core';
import { RouterModule } from '@angular/router';

import SharedModule from 'app/shared/shared.module';
import { IParentorganization } from '../parentorganization.model';

@Component({
  selector: 'jhi-parentorganization-detail',
  templateUrl: './parentorganization-detail.component.html',
  imports: [SharedModule, RouterModule],
})
export class ParentorganizationDetailComponent {
  parentorganization = input<IParentorganization | null>(null);

  previousState(): void {
    window.history.back();
  }
}
