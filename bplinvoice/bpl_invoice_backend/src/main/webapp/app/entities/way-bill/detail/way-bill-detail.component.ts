import { Component, input } from '@angular/core';
import { RouterModule } from '@angular/router';

import SharedModule from 'app/shared/shared.module';
import { FormatMediumDatetimePipe } from 'app/shared/date';
import { IWayBill } from '../way-bill.model';

@Component({
  selector: 'jhi-way-bill-detail',
  templateUrl: './way-bill-detail.component.html',
  imports: [SharedModule, RouterModule, FormatMediumDatetimePipe],
})
export class WayBillDetailComponent {
  wayBill = input<IWayBill | null>(null);

  previousState(): void {
    window.history.back();
  }
}
