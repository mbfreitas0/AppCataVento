import { ProductUpdateComponent } from './components/product/product-update/product-update.component';
import { ProductCreateComponent } from './components/product/product-create/product-create.component';
import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { HomeComponent } from './views/home/home.component';
import { ProductCrudComponent } from './views/product-crud/product-crud.component';
import { ProductDeleteComponent } from './components/product/product-delete/product-delete.component';
import { ProductReadComponent } from './components/product/product-read/product-read.component';
import { SearchProductComponent } from './components/stock/search-product/search-product.component';
import { StockReadComponent } from './components/stock/stock-read/stock-read.component';
import { OutputProductComponent } from './components/stock/output-product/output-product.component';
import { ProductRead2Component } from './components/product/product-read2/product-read2.component';
import { EntryProductsComponent } from './components/stock/entry-products/entry-products.component';

const routes: Routes = [
  { path: "", component: HomeComponent },
  { path: "products", component: ProductCrudComponent },
  { path: 'products/create', component: ProductCreateComponent },
  { path: 'products/read', component: ProductReadComponent },
  { path: 'products/read2', component: ProductRead2Component },
  { path: 'products/update/:id', component: ProductUpdateComponent },
  { path: 'products/delete/:id', component: ProductDeleteComponent },
  { path: 'products/search-product/', component: SearchProductComponent },
  { path: 'stock/entry-products/:id', component: EntryProductsComponent},
  { path: 'stock/stock-read', component: StockReadComponent },
  { path: 'output-product/:id', component: OutputProductComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
