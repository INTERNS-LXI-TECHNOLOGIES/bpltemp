import { Component, input } from '@angular/core';
import { RouterModule } from '@angular/router';

import SharedModule from 'app/shared/shared.module';
import { IOrganisation } from '../organisation.model';

@Component({
  selector: 'jhi-organisation-detail',
  templateUrl: './organisation-detail.component.html',
  imports: [SharedModule, RouterModule],
})
export class OrganisationDetailComponent {
  organisation = input<IOrganisation | null>(null);

  previousState(): void {
    window.history.back();
  }
}
