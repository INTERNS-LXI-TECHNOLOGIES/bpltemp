import { ComponentFixture, TestBed } from '@angular/core/testing';
import { provideRouter, withComponentInputBinding } from '@angular/router';
import { RouterTestingHarness } from '@angular/router/testing';
import { of } from 'rxjs';

import { CurrencyTypeDetailComponent } from './currency-type-detail.component';

describe('CurrencyType Management Detail Component', () => {
  let comp: CurrencyTypeDetailComponent;
  let fixture: ComponentFixture<CurrencyTypeDetailComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [CurrencyTypeDetailComponent],
      providers: [
        provideRouter(
          [
            {
              path: '**',
              loadComponent: () => import('./currency-type-detail.component').then(m => m.CurrencyTypeDetailComponent),
              resolve: { currencyType: () => of({ id: 3445 }) },
            },
          ],
          withComponentInputBinding(),
        ),
      ],
    })
      .overrideTemplate(CurrencyTypeDetailComponent, '')
      .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(CurrencyTypeDetailComponent);
    comp = fixture.componentInstance;
  });

  describe('OnInit', () => {
    it('Should load currencyType on init', async () => {
      const harness = await RouterTestingHarness.create();
      const instance = await harness.navigateByUrl('/', CurrencyTypeDetailComponent);

      // THEN
      expect(instance.currencyType()).toEqual(expect.objectContaining({ id: 3445 }));
    });
  });

  describe('PreviousState', () => {
    it('Should navigate to previous state', () => {
      jest.spyOn(window.history, 'back');
      comp.previousState();
      expect(window.history.back).toHaveBeenCalled();
    });
  });
});
