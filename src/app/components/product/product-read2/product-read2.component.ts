import { AfterViewInit, Component, OnInit, ViewChild } from '@angular/core';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatTable } from '@angular/material/table';
import { ProductRead2DataSource } from './product-read2-datasource';
import { Product } from '../product.model';
import { ProductService } from '../product.service';

@Component({
  selector: 'app-product-read2',
  templateUrl: './product-read2.component.html',
  styleUrls: ['./product-read2.component.css']
})
export class ProductRead2Component implements AfterViewInit, OnInit {
  @ViewChild(MatPaginator) paginator: MatPaginator;
  @ViewChild(MatSort) sort: MatSort;
  @ViewChild(MatTable) table: MatTable<Product>;
  dataSource: ProductRead2DataSource;

  products: Product[];

  /** Columns displayed in the table. Columns IDs can be added, removed, or reordered. */
  displayedColumns = ['id', 'descricao', 'status', 'estoque_min', 'estoque_max', 'action']
  
  constructor(private productService: ProductService) { }
  
  ngOnInit() {
    this.dataSource = new ProductRead2DataSource();

    this.productService.read().subscribe(products => {
      
      this.products = products['produtos'];
      console.log(products)
      
    })
  }
  

  ngAfterViewInit() {
    this.dataSource.sort = this.sort;
    this.dataSource.paginator = this.paginator;
    this.table.dataSource = this.dataSource;
  }
}
