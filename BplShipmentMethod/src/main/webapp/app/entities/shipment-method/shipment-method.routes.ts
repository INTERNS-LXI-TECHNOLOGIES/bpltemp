import { Routes } from '@angular/router';

import { UserRouteAccessService } from 'app/core/auth/user-route-access.service';
import { ASC } from 'app/config/navigation.constants';
import ShipmentMethodResolve from './route/shipment-method-routing-resolve.service';

const shipmentMethodRoute: Routes = [
  {
    path: '',
    loadComponent: () => import('./list/shipment-method.component').then(m => m.ShipmentMethodComponent),
    data: {
      defaultSort: `id,${ASC}`,
    },
    canActivate: [UserRouteAccessService],
  },
  {
    path: ':id/view',
    loadComponent: () => import('./detail/shipment-method-detail.component').then(m => m.ShipmentMethodDetailComponent),
    resolve: {
      shipmentMethod: ShipmentMethodResolve,
    },
    canActivate: [UserRouteAccessService],
  },
  {
    path: 'new',
    loadComponent: () => import('./update/shipment-method-update.component').then(m => m.ShipmentMethodUpdateComponent),
    resolve: {
      shipmentMethod: ShipmentMethodResolve,
    },
    canActivate: [UserRouteAccessService],
  },
  {
    path: ':id/edit',
    loadComponent: () => import('./update/shipment-method-update.component').then(m => m.ShipmentMethodUpdateComponent),
    resolve: {
      shipmentMethod: ShipmentMethodResolve,
    },
    canActivate: [UserRouteAccessService],
  },
];

export default shipmentMethodRoute;
