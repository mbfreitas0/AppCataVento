import { HttpClient } from '@angular/common/http';
import { Component, OnInit, ViewChild } from '@angular/core';
import { FormControl } from '@angular/forms';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { ActivatedRoute, Router } from '@angular/router';
import { Observable } from 'rxjs';
import { Product } from '../../product/product.model';
import { ProductService } from '../../product/product.service';
import { Stock } from '../stock.model';
import { StockService } from '../stock.service';

@Component({
  selector: 'app-stock',
  templateUrl: './stock.component.html',
  styleUrls: ['./stock.component.css']
})
export class StockComponent implements OnInit {
  dataSource: MatTableDataSource<Stock>;
  //dataSource: MatTableDataSource<Product>;
  stocks: Stock[];
  //products: Product[];   

  @ViewChild(MatPaginator) paginator: MatPaginator;
  @ViewChild(MatSort) sort: MatSort;
   

  /** Columns displayed in the table. Columns IDs can be added, removed, or reordered. */
  displayedColumns: string[] = ['id', 'qtde','valor_unitario', 'data_entrada','action'];
  
  constructor(private stockService: StockService) { }
  
  ngOnInit() {
   
    this.stockService.read().subscribe(stocks => {      
      this.stocks = stocks;
      this.dataSource = new MatTableDataSource(this.stocks);
      console.log(this.stocks)
      
    })
  }  

  ngAfterViewInit() {
    this.dataSource.sort = this.sort;
    this.dataSource.paginator = this.paginator;
    
  }

  applyFilter(event) {
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase();
  }


}


