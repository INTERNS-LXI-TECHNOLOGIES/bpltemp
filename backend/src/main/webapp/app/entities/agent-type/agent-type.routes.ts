import { Routes } from '@angular/router';

import { UserRouteAccessService } from 'app/core/auth/user-route-access.service';
import { ASC } from 'app/config/navigation.constants';
import AgentTypeResolve from './route/agent-type-routing-resolve.service';

const agentTypeRoute: Routes = [
  {
    path: '',
    loadComponent: () => import('./list/agent-type.component').then(m => m.AgentTypeComponent),
    data: {
      defaultSort: `id,${ASC}`,
    },
    canActivate: [UserRouteAccessService],
  },
  {
    path: ':id/view',
    loadComponent: () => import('./detail/agent-type-detail.component').then(m => m.AgentTypeDetailComponent),
    resolve: {
      agentType: AgentTypeResolve,
    },
    canActivate: [UserRouteAccessService],
  },
  {
    path: 'new',
    loadComponent: () => import('./update/agent-type-update.component').then(m => m.AgentTypeUpdateComponent),
    resolve: {
      agentType: AgentTypeResolve,
    },
    canActivate: [UserRouteAccessService],
  },
  {
    path: ':id/edit',
    loadComponent: () => import('./update/agent-type-update.component').then(m => m.AgentTypeUpdateComponent),
    resolve: {
      agentType: AgentTypeResolve,
    },
    canActivate: [UserRouteAccessService],
  },
];

export default agentTypeRoute;
