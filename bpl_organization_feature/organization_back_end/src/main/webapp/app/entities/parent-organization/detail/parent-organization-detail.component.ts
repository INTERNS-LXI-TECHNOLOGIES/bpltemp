import { Component, input } from '@angular/core';
import { RouterModule } from '@angular/router';

import SharedModule from 'app/shared/shared.module';
import { IParentOrganization } from '../parent-organization.model';

@Component({
  selector: 'jhi-parent-organization-detail',
  templateUrl: './parent-organization-detail.component.html',
  imports: [SharedModule, RouterModule],
})
export class ParentOrganizationDetailComponent {
  parentOrganization = input<IParentOrganization | null>(null);

  previousState(): void {
    window.history.back();
  }
}
