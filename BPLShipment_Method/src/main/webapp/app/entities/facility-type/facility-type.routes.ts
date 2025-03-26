import { Routes } from '@angular/router';

import { UserRouteAccessService } from 'app/core/auth/user-route-access.service';
import { ASC } from 'app/config/navigation.constants';
import FacilityTypeResolve from './route/facility-type-routing-resolve.service';

const facilityTypeRoute: Routes = [
  {
    path: '',
    loadComponent: () => import('./list/facility-type.component').then(m => m.FacilityTypeComponent),
    data: {
      defaultSort: `id,${ASC}`,
    },
    canActivate: [UserRouteAccessService],
  },
  {
    path: ':id/view',
    loadComponent: () => import('./detail/facility-type-detail.component').then(m => m.FacilityTypeDetailComponent),
    resolve: {
      facilityType: FacilityTypeResolve,
    },
    canActivate: [UserRouteAccessService],
  },
  {
    path: 'new',
    loadComponent: () => import('./update/facility-type-update.component').then(m => m.FacilityTypeUpdateComponent),
    resolve: {
      facilityType: FacilityTypeResolve,
    },
    canActivate: [UserRouteAccessService],
  },
  {
    path: ':id/edit',
    loadComponent: () => import('./update/facility-type-update.component').then(m => m.FacilityTypeUpdateComponent),
    resolve: {
      facilityType: FacilityTypeResolve,
    },
    canActivate: [UserRouteAccessService],
  },
];

export default facilityTypeRoute;
