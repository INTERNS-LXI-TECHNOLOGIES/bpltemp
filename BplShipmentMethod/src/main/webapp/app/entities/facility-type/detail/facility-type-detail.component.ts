import { Component, input } from '@angular/core';
import { RouterModule } from '@angular/router';

import SharedModule from 'app/shared/shared.module';
import { IFacilityType } from '../facility-type.model';

@Component({
  selector: 'jhi-facility-type-detail',
  templateUrl: './facility-type-detail.component.html',
  imports: [SharedModule, RouterModule],
})
export class FacilityTypeDetailComponent {
  facilityType = input<IFacilityType | null>(null);

  previousState(): void {
    window.history.back();
  }
}
