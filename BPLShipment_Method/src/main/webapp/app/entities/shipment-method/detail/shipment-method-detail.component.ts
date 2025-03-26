import { Component, input } from '@angular/core';
import { RouterModule } from '@angular/router';

import SharedModule from 'app/shared/shared.module';
import { IShipmentMethod } from '../shipment-method.model';

@Component({
  selector: 'jhi-shipment-method-detail',
  templateUrl: './shipment-method-detail.component.html',
  imports: [SharedModule, RouterModule],
})
export class ShipmentMethodDetailComponent {
  shipmentMethod = input<IShipmentMethod | null>(null);

  previousState(): void {
    window.history.back();
  }
}
