import { Routes } from '@angular/router';

import { UserRouteAccessService } from 'app/core/auth/user-route-access.service';
import { ASC } from 'app/config/navigation.constants';
import WayBillResolve from './route/way-bill-routing-resolve.service';

const wayBillRoute: Routes = [
  {
    path: '',
    loadComponent: () => import('./list/way-bill.component').then(m => m.WayBillComponent),
    data: {
      defaultSort: `id,${ASC}`,
    },
    canActivate: [UserRouteAccessService],
  },
  {
    path: ':id/view',
    loadComponent: () => import('./detail/way-bill-detail.component').then(m => m.WayBillDetailComponent),
    resolve: {
      wayBill: WayBillResolve,
    },
    canActivate: [UserRouteAccessService],
  },
  {
    path: 'new',
    loadComponent: () => import('./update/way-bill-update.component').then(m => m.WayBillUpdateComponent),
    resolve: {
      wayBill: WayBillResolve,
    },
    canActivate: [UserRouteAccessService],
  },
  {
    path: ':id/edit',
    loadComponent: () => import('./update/way-bill-update.component').then(m => m.WayBillUpdateComponent),
    resolve: {
      wayBill: WayBillResolve,
    },
    canActivate: [UserRouteAccessService],
  },
];

export default wayBillRoute;
