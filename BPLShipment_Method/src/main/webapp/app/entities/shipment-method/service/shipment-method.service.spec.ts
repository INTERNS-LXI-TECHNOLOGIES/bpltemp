import { TestBed } from '@angular/core/testing';
import { HttpTestingController, provideHttpClientTesting } from '@angular/common/http/testing';
import { provideHttpClient } from '@angular/common/http';

import { IShipmentMethod } from '../shipment-method.model';
import { sampleWithFullData, sampleWithNewData, sampleWithPartialData, sampleWithRequiredData } from '../shipment-method.test-samples';

import { ShipmentMethodService } from './shipment-method.service';

const requireRestSample: IShipmentMethod = {
  ...sampleWithRequiredData,
};

describe('ShipmentMethod Service', () => {
  let service: ShipmentMethodService;
  let httpMock: HttpTestingController;
  let expectedResult: IShipmentMethod | IShipmentMethod[] | boolean | null;

  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [provideHttpClient(), provideHttpClientTesting()],
    });
    expectedResult = null;
    service = TestBed.inject(ShipmentMethodService);
    httpMock = TestBed.inject(HttpTestingController);
  });

  describe('Service methods', () => {
    it('should find an element', () => {
      const returnedFromService = { ...requireRestSample };
      const expected = { ...sampleWithRequiredData };

      service.find(123).subscribe(resp => (expectedResult = resp.body));

      const req = httpMock.expectOne({ method: 'GET' });
      req.flush(returnedFromService);
      expect(expectedResult).toMatchObject(expected);
    });

    it('should create a ShipmentMethod', () => {
      const shipmentMethod = { ...sampleWithNewData };
      const returnedFromService = { ...requireRestSample };
      const expected = { ...sampleWithRequiredData };

      service.create(shipmentMethod).subscribe(resp => (expectedResult = resp.body));

      const req = httpMock.expectOne({ method: 'POST' });
      req.flush(returnedFromService);
      expect(expectedResult).toMatchObject(expected);
    });

    it('should update a ShipmentMethod', () => {
      const shipmentMethod = { ...sampleWithRequiredData };
      const returnedFromService = { ...requireRestSample };
      const expected = { ...sampleWithRequiredData };

      service.update(shipmentMethod).subscribe(resp => (expectedResult = resp.body));

      const req = httpMock.expectOne({ method: 'PUT' });
      req.flush(returnedFromService);
      expect(expectedResult).toMatchObject(expected);
    });

    it('should partial update a ShipmentMethod', () => {
      const patchObject = { ...sampleWithPartialData };
      const returnedFromService = { ...requireRestSample };
      const expected = { ...sampleWithRequiredData };

      service.partialUpdate(patchObject).subscribe(resp => (expectedResult = resp.body));

      const req = httpMock.expectOne({ method: 'PATCH' });
      req.flush(returnedFromService);
      expect(expectedResult).toMatchObject(expected);
    });

    it('should return a list of ShipmentMethod', () => {
      const returnedFromService = { ...requireRestSample };

      const expected = { ...sampleWithRequiredData };

      service.query().subscribe(resp => (expectedResult = resp.body));

      const req = httpMock.expectOne({ method: 'GET' });
      req.flush([returnedFromService]);
      httpMock.verify();
      expect(expectedResult).toMatchObject([expected]);
    });

    it('should delete a ShipmentMethod', () => {
      const expected = true;

      service.delete(123).subscribe(resp => (expectedResult = resp.ok));

      const req = httpMock.expectOne({ method: 'DELETE' });
      req.flush({ status: 200 });
      expect(expectedResult).toBe(expected);
    });

    describe('addShipmentMethodToCollectionIfMissing', () => {
      it('should add a ShipmentMethod to an empty array', () => {
        const shipmentMethod: IShipmentMethod = sampleWithRequiredData;
        expectedResult = service.addShipmentMethodToCollectionIfMissing([], shipmentMethod);
        expect(expectedResult).toHaveLength(1);
        expect(expectedResult).toContain(shipmentMethod);
      });

      it('should not add a ShipmentMethod to an array that contains it', () => {
        const shipmentMethod: IShipmentMethod = sampleWithRequiredData;
        const shipmentMethodCollection: IShipmentMethod[] = [
          {
            ...shipmentMethod,
          },
          sampleWithPartialData,
        ];
        expectedResult = service.addShipmentMethodToCollectionIfMissing(shipmentMethodCollection, shipmentMethod);
        expect(expectedResult).toHaveLength(2);
      });

      it("should add a ShipmentMethod to an array that doesn't contain it", () => {
        const shipmentMethod: IShipmentMethod = sampleWithRequiredData;
        const shipmentMethodCollection: IShipmentMethod[] = [sampleWithPartialData];
        expectedResult = service.addShipmentMethodToCollectionIfMissing(shipmentMethodCollection, shipmentMethod);
        expect(expectedResult).toHaveLength(2);
        expect(expectedResult).toContain(shipmentMethod);
      });

      it('should add only unique ShipmentMethod to an array', () => {
        const shipmentMethodArray: IShipmentMethod[] = [sampleWithRequiredData, sampleWithPartialData, sampleWithFullData];
        const shipmentMethodCollection: IShipmentMethod[] = [sampleWithRequiredData];
        expectedResult = service.addShipmentMethodToCollectionIfMissing(shipmentMethodCollection, ...shipmentMethodArray);
        expect(expectedResult).toHaveLength(3);
      });

      it('should accept varargs', () => {
        const shipmentMethod: IShipmentMethod = sampleWithRequiredData;
        const shipmentMethod2: IShipmentMethod = sampleWithPartialData;
        expectedResult = service.addShipmentMethodToCollectionIfMissing([], shipmentMethod, shipmentMethod2);
        expect(expectedResult).toHaveLength(2);
        expect(expectedResult).toContain(shipmentMethod);
        expect(expectedResult).toContain(shipmentMethod2);
      });

      it('should accept null and undefined values', () => {
        const shipmentMethod: IShipmentMethod = sampleWithRequiredData;
        expectedResult = service.addShipmentMethodToCollectionIfMissing([], null, shipmentMethod, undefined);
        expect(expectedResult).toHaveLength(1);
        expect(expectedResult).toContain(shipmentMethod);
      });

      it('should return initial array if no ShipmentMethod is added', () => {
        const shipmentMethodCollection: IShipmentMethod[] = [sampleWithRequiredData];
        expectedResult = service.addShipmentMethodToCollectionIfMissing(shipmentMethodCollection, undefined, null);
        expect(expectedResult).toEqual(shipmentMethodCollection);
      });
    });

    describe('compareShipmentMethod', () => {
      it('Should return true if both entities are null', () => {
        const entity1 = null;
        const entity2 = null;

        const compareResult = service.compareShipmentMethod(entity1, entity2);

        expect(compareResult).toEqual(true);
      });

      it('Should return false if one entity is null', () => {
        const entity1 = { id: 28010 };
        const entity2 = null;

        const compareResult1 = service.compareShipmentMethod(entity1, entity2);
        const compareResult2 = service.compareShipmentMethod(entity2, entity1);

        expect(compareResult1).toEqual(false);
        expect(compareResult2).toEqual(false);
      });

      it('Should return false if primaryKey differs', () => {
        const entity1 = { id: 28010 };
        const entity2 = { id: 22712 };

        const compareResult1 = service.compareShipmentMethod(entity1, entity2);
        const compareResult2 = service.compareShipmentMethod(entity2, entity1);

        expect(compareResult1).toEqual(false);
        expect(compareResult2).toEqual(false);
      });

      it('Should return false if primaryKey matches', () => {
        const entity1 = { id: 28010 };
        const entity2 = { id: 28010 };

        const compareResult1 = service.compareShipmentMethod(entity1, entity2);
        const compareResult2 = service.compareShipmentMethod(entity2, entity1);

        expect(compareResult1).toEqual(true);
        expect(compareResult2).toEqual(true);
      });
    });
  });

  afterEach(() => {
    httpMock.verify();
  });
});
