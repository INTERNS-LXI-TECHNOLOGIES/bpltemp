import { Routes } from '@angular/router';

import { UserRouteAccessService } from 'app/core/auth/user-route-access.service';
import { ASC } from 'app/config/navigation.constants';
import CurrencyTypeResolve from './route/currency-type-routing-resolve.service';

const currencyTypeRoute: Routes = [
  {
    path: '',
    loadComponent: () => import('./list/currency-type.component').then(m => m.CurrencyTypeComponent),
    data: {
      defaultSort: `id,${ASC}`,
    },
    canActivate: [UserRouteAccessService],
  },
  {
    path: ':id/view',
    loadComponent: () => import('./detail/currency-type-detail.component').then(m => m.CurrencyTypeDetailComponent),
    resolve: {
      currencyType: CurrencyTypeResolve,
    },
    canActivate: [UserRouteAccessService],
  },
  {
    path: 'new',
    loadComponent: () => import('./update/currency-type-update.component').then(m => m.CurrencyTypeUpdateComponent),
    resolve: {
      currencyType: CurrencyTypeResolve,
    },
    canActivate: [UserRouteAccessService],
  },
  {
    path: ':id/edit',
    loadComponent: () => import('./update/currency-type-update.component').then(m => m.CurrencyTypeUpdateComponent),
    resolve: {
      currencyType: CurrencyTypeResolve,
    },
    canActivate: [UserRouteAccessService],
  },
];

export default currencyTypeRoute;
