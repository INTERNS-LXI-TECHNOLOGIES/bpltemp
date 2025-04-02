import { Routes } from '@angular/router';

import { UserRouteAccessService } from 'app/core/auth/user-route-access.service';
import { ASC } from 'app/config/navigation.constants';
import ParentorganizationResolve from './route/parentorganization-routing-resolve.service';

const parentorganizationRoute: Routes = [
  {
    path: '',
    loadComponent: () => import('./list/parentorganization.component').then(m => m.ParentorganizationComponent),
    data: {
      defaultSort: `id,${ASC}`,
    },
    canActivate: [UserRouteAccessService],
  },
  {
    path: ':id/view',
    loadComponent: () => import('./detail/parentorganization-detail.component').then(m => m.ParentorganizationDetailComponent),
    resolve: {
      parentorganization: ParentorganizationResolve,
    },
    canActivate: [UserRouteAccessService],
  },
  {
    path: 'new',
    loadComponent: () => import('./update/parentorganization-update.component').then(m => m.ParentorganizationUpdateComponent),
    resolve: {
      parentorganization: ParentorganizationResolve,
    },
    canActivate: [UserRouteAccessService],
  },
  {
    path: ':id/edit',
    loadComponent: () => import('./update/parentorganization-update.component').then(m => m.ParentorganizationUpdateComponent),
    resolve: {
      parentorganization: ParentorganizationResolve,
    },
    canActivate: [UserRouteAccessService],
  },
];

export default parentorganizationRoute;
