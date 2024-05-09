// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/api_datasource_contract/all_brands_datasource_contract.dart'
    as _i4;
import '../../data/api_datasource_contract/all_categories_datasource_contract.dart'
    as _i10;
import '../../data/api_datasource_contract/product_datasource_contract.dart'
    as _i6;
import '../../data/api_datasource_contract/sub_category_datasource_contract.dart'
    as _i8;
import '../../data/api_datasource_impl/all_brands_datasource_impl.dart' as _i5;
import '../../data/api_datasource_impl/all_categories_datasource_impl.dart'
    as _i11;
import '../../data/api_datasource_impl/products_datasource_impl.dart' as _i7;
import '../../data/api_datasource_impl/sub_category_datasource_impl.dart'
    as _i9;
import '../../data/repository_impl/all_brands_repo_impl.dart' as _i19;
import '../../data/repository_impl/all_categories_repo_impl.dart' as _i15;
import '../../data/repository_impl/product_repo_impl.dart' as _i13;
import '../../data/repository_impl/sub_category_repo_impl.dart' as _i17;
import '../../domain/repository_contract/all_brands_repo.dart' as _i18;
import '../../domain/repository_contract/all_categories_repo.dart' as _i14;
import '../../domain/repository_contract/product_repo.dart' as _i12;
import '../../domain/repository_contract/sub_category_repo.dart' as _i16;
import '../../domain/use_cases/home_cases/brands_use_case.dart' as _i23;
import '../../domain/use_cases/home_cases/categories_usecase.dart' as _i20;
import '../../domain/use_cases/home_cases/most_selling_products_usecase.dart'
    as _i22;
import '../../domain/use_cases/home_cases/sub_category_usecase.dart' as _i21;
import '../../presentation/screens/home/tabs/categorise_tab/view_models/left_side_view_model.dart'
    as _i25;
import '../../presentation/screens/home/tabs/categorise_tab/view_models/right_side_view_model.dart'
    as _i24;
import '../../presentation/screens/home/tabs/home_tab/view_models/brands_view_model.dart'
    as _i27;
import '../../presentation/screens/home/tabs/home_tab/view_models/categories_view_model.dart'
    as _i26;
import '../../presentation/screens/home/tabs/home_tab/view_models/most_selling_view_model.dart'
    as _i28;
import '../api/api_manager.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ApiManager>(() => _i3.ApiManager());
    gh.factory<_i4.AllBrandsDatasourceContract>(
        () => _i5.AllBrandsDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i6.ProductDatasourceContract>(
        () => _i7.ProductDatasourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i8.SubCategoryDatasourceContract>(
        () => _i9.SubCategoryDatasourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i10.AllCategoriesContract>(
        () => _i11.AllCategoriesImpl(gh<_i3.ApiManager>()));
    gh.factory<_i12.ProductsRepo>(
        () => _i13.ProductsRepoImpl(gh<_i6.ProductDatasourceContract>()));
    gh.factory<_i14.AllCategoriesRepo>(
        () => _i15.AllCategoriesRepoImpl(gh<_i10.AllCategoriesContract>()));
    gh.factory<_i16.SubCategoryRepo>(() =>
        _i17.SubCategoryRepoImpl(gh<_i8.SubCategoryDatasourceContract>()));
    gh.factory<_i18.AllBrandsRepo>(
        () => _i19.AllBrandsRepoImpl(gh<_i4.AllBrandsDatasourceContract>()));
    gh.factory<_i20.CategoriesUseCase>(
        () => _i20.CategoriesUseCase(gh<_i14.AllCategoriesRepo>()));
    gh.factory<_i21.SubCategoryUseCase>(
        () => _i21.SubCategoryUseCase(gh<_i16.SubCategoryRepo>()));
    gh.factory<_i22.MostSellingProductsUsecase>(
        () => _i22.MostSellingProductsUsecase(gh<_i12.ProductsRepo>()));
    gh.factory<_i23.BrandUsecase>(
        () => _i23.BrandUsecase(gh<_i18.AllBrandsRepo>()));
    gh.factory<_i24.RightSideViewModel>(
        () => _i24.RightSideViewModel(gh<_i21.SubCategoryUseCase>()));
    gh.factory<_i25.LeftSideViewModel>(
        () => _i25.LeftSideViewModel(gh<_i20.CategoriesUseCase>()));
    gh.factory<_i26.CategoriesViewModel>(
        () => _i26.CategoriesViewModel(gh<_i20.CategoriesUseCase>()));
    gh.factory<_i27.BrandViewModel>(
        () => _i27.BrandViewModel(gh<_i23.BrandUsecase>()));
    gh.factory<_i28.MostSellingProductsViewModel>(() =>
        _i28.MostSellingProductsViewModel(
            gh<_i22.MostSellingProductsUsecase>()));
    return this;
  }
}
