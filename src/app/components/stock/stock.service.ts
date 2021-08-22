import { map, catchError } from 'rxjs/operators';
import { Injectable } from '@angular/core';
import { MatSnackBar } from '@angular/material/snack-bar'
import { HttpClient } from '@angular/common/http';
import { Stock } from '../stock/stock.model';
import { Observable, EMPTY } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class StockService {
  baseUrl = 'http://localhost:3000/product_entry'
  constructor(private snackBar: MatSnackBar, private http: HttpClient) {
  }

  showMessage(msg: string, isError: boolean = false): void {
    this.snackBar.open(msg, 'X', {
      duration: 3000,
      horizontalPosition: "right",
      verticalPosition: "top",
      panelClass: isError ? ['msg-error'] : ['msg-success']
    })
  }

  create(stock: Stock): Observable<Stock> {
    return this.http.post<Stock>(this.baseUrl, stock).pipe(
      map((obj) => obj),
      catchError(err => this.errorHandler(err))
    );
  }

  read(): Observable<Stock[]> {
    return this.http.get<Stock[]>(this.baseUrl).pipe(
      //map((obj) => obj),
      catchError(err => this.errorHandler(err))
    );
  }

  readById(id: String): Observable<Stock> {
    const url = `${this.baseUrl}/${id}`
    return this.http.get<Stock>(url).pipe(
      //map((obj) => obj),
      catchError(err => this.errorHandler(err))
    );
  }

  update(stock: Stock): Observable<Stock> {
    const url = `${this.baseUrl}/${stock.id}`
    return this.http.put<Stock>(url, stock).pipe(
      map((obj) => obj),
      
      catchError(err => this.errorHandler(err))
    );
  }

  delete(stock: Stock): Observable<Stock> {
    const url = `${this.baseUrl}/${stock.id}`
    return this.http.delete<Stock>(url).pipe(
      map((obj) => obj),
      catchError(err => this.errorHandler(err))
    );
  }

  errorHandler(e: any): Observable<any> {
    this.showMessage(`Ocorreu algum erro msg: ${e.message}`, true);
    return EMPTY;
  }
}
