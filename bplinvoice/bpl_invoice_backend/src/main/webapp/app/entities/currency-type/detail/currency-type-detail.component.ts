import { Component, input } from '@angular/core';
import { RouterModule } from '@angular/router';

import SharedModule from 'app/shared/shared.module';
import { ICurrencyType } from '../currency-type.model';

@Component({
  selector: 'jhi-currency-type-detail',
  templateUrl: './currency-type-detail.component.html',
  imports: [SharedModule, RouterModule],
})
export class CurrencyTypeDetailComponent {
  currencyType = input<ICurrencyType | null>(null);

  previousState(): void {
    window.history.back();
  }
}
