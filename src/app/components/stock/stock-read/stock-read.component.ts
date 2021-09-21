import { AfterViewInit, ViewChild } from '@angular/core';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { Component, OnInit } from '@angular/core';
import { StockRead } from '../stock/stock-read.model';
import { Product } from '../../product/product.model';
import { ProductService } from '../../product/product.service';
import { StockReadService } from '../stock-read.service';

@Component({
  selector: 'app-stock-read',
  templateUrl: './stock-read.component.html',
  styleUrls: ['./stock-read.component.css']
})
export class StockReadComponent implements OnInit {
  dataSource: MatTableDataSource<StockRead>;
  stock: StockRead[];
  dataSourceP: MatTableDataSource<Product>;
  product: Product[];

  @ViewChild(MatPaginator) paginator: MatPaginator;
  @ViewChild(MatSort) sort: MatSort;


  /** Columns displayed in the table. Columns IDs can be added, removed, or reordered. */
  displayedColumns: string[] = ['id', 'descricao', 'qtde', 'valor_unitario', 'action'];

  constructor(
    private productService: ProductService,
    private stockService: StockReadService,

  ) { }

  ngOnInit(): void {
    this.stockService.read().subscribe(stock => {
      //this.stocks = stocks['produtos'];
      this.stock = stock;
      this.dataSource = new MatTableDataSource(this.stock);
      console.log(stock)
    });
  }

  ngAfterViewInit() {
    this.dataSource.sort = this.sort;
    this.dataSource.paginator = this.paginator;

  }

  applyFilter(event) {
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toUpperCase();
  }


}

