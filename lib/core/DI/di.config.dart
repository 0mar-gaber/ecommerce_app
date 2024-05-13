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
import '../../data/api_datasource_contract/auth_datasource_contract.dart'
    as _i14;
import '../../data/api_datasource_contract/product_datasource_contract.dart'
    as _i6;
import '../../data/api_datasource_contract/products_by_category_id_contract.dart'
    as _i12;
import '../../data/api_datasource_contract/sub_category_datasource_contract.dart'
    as _i8;
import '../../data/api_datasource_impl/all_brands_datasource_impl.dart' as _i5;
import '../../data/api_datasource_impl/all_categories_datasource_impl.dart'
    as _i11;
import '../../data/api_datasource_impl/auth_datasource_impl.dart' as _i15;
import '../../data/api_datasource_impl/products_by_category_id_impl.dart'
    as _i13;
import '../../data/api_datasource_impl/products_datasource_impl.dart' as _i7;
import '../../data/api_datasource_impl/sub_category_datasource_impl.dart'
    as _i9;
import '../../data/repository_impl/all_brands_repo_impl.dart' as _i26;
import '../../data/repository_impl/all_categories_repo_impl.dart' as _i21;
import '../../data/repository_impl/product_repo_impl.dart' as _i19;
import '../../data/repository_impl/products_by_subcategory_id_repo_impl.dart'
    as _i17;
import '../../data/repository_impl/signup_repo_impl.dart' as _i30;
import '../../data/repository_impl/sub_category_repo_impl.dart' as _i24;
import '../../domain/repository_contract/all_brands_repo.dart' as _i25;
import '../../domain/repository_contract/all_categories_repo.dart' as _i20;
import '../../domain/repository_contract/auth_repo.dart' as _i29;
import '../../domain/repository_contract/product_repo.dart' as _i18;
import '../../domain/repository_contract/products_by_subcategory_id_repo.dart'
    as _i16;
import '../../domain/repository_contract/sub_category_repo.dart' as _i23;
import '../../domain/use_cases/auth_cases/auth_usecase.dart' as _i38;
import '../../domain/use_cases/home_cases/brands_use_case.dart' as _i32;
import '../../domain/use_cases/home_cases/categories_usecase.dart' as _i27;
import '../../domain/use_cases/home_cases/most_selling_products_usecase.dart'
    as _i31;
import '../../domain/use_cases/home_cases/sub_category_usecase.dart' as _i28;
import '../../domain/use_cases/product_screen_cases/get_products_by_subcategory_id_usecase.dart'
    as _i22;
import '../../presentation/screens/auth/auth_view_model.dart' as _i40;
import '../../presentation/screens/home/tabs/categorise_tab/view_models/left_side_view_model.dart'
    as _i35;
import '../../presentation/screens/home/tabs/categorise_tab/view_models/right_side_view_model.dart'
    as _i33;
import '../../presentation/screens/home/tabs/home_tab/view_models/brands_view_model.dart'
    as _i37;
import '../../presentation/screens/home/tabs/home_tab/view_models/categories_view_model.dart'
    as _i36;
import '../../presentation/screens/home/tabs/home_tab/view_models/most_selling_view_model.dart'
    as _i39;
import '../../presentation/screens/products/products_view_model.dart' as _i34;
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
    gh.factory<_i12.ProductsBySubCategoryId>(
        () => _i13.ProductsByCategoryIdImpl(gh<_i3.ApiManager>()));
    gh.factory<_i14.AuthDatasourceContract>(
        () => _i15.AuthDatasourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i16.ProductsBySubcategoryIdRepo>(() =>
        _i17.ProductsBySubcategoryIdRepoImpl(
            gh<_i12.ProductsBySubCategoryId>()));
    gh.factory<_i18.ProductsRepo>(
        () => _i19.ProductsRepoImpl(gh<_i6.ProductDatasourceContract>()));
    gh.factory<_i20.AllCategoriesRepo>(
        () => _i21.AllCategoriesRepoImpl(gh<_i10.AllCategoriesContract>()));
    gh.factory<_i22.GetProductsBySubcategoryIdUsecase>(() =>
        _i22.GetProductsBySubcategoryIdUsecase(
            gh<_i16.ProductsBySubcategoryIdRepo>()));
    gh.factory<_i23.SubCategoryRepo>(() =>
        _i24.SubCategoryRepoImpl(gh<_i8.SubCategoryDatasourceContract>()));
    gh.factory<_i25.AllBrandsRepo>(
        () => _i26.AllBrandsRepoImpl(gh<_i4.AllBrandsDatasourceContract>()));
    gh.factory<_i27.CategoriesUseCase>(
        () => _i27.CategoriesUseCase(gh<_i20.AllCategoriesRepo>()));
    gh.factory<_i28.SubCategoryUseCase>(
        () => _i28.SubCategoryUseCase(gh<_i23.SubCategoryRepo>()));
    gh.factory<_i29.AuthRepo>(
        () => _i30.SignupRepoImpl(gh<_i14.AuthDatasourceContract>()));
    gh.factory<_i31.MostSellingProductsUsecase>(
        () => _i31.MostSellingProductsUsecase(gh<_i18.ProductsRepo>()));
    gh.factory<_i32.BrandUsecase>(
        () => _i32.BrandUsecase(gh<_i25.AllBrandsRepo>()));
    gh.factory<_i33.RightSideViewModel>(
        () => _i33.RightSideViewModel(gh<_i28.SubCategoryUseCase>()));
    gh.factory<_i34.ProductsBySubcategoryIdViewModel>(() =>
        _i34.ProductsBySubcategoryIdViewModel(
            gh<_i22.GetProductsBySubcategoryIdUsecase>()));
    gh.factory<_i35.LeftSideViewModel>(
        () => _i35.LeftSideViewModel(gh<_i27.CategoriesUseCase>()));
    gh.factory<_i36.CategoriesViewModel>(
        () => _i36.CategoriesViewModel(gh<_i27.CategoriesUseCase>()));
    gh.factory<_i37.BrandViewModel>(
        () => _i37.BrandViewModel(gh<_i32.BrandUsecase>()));
    gh.factory<_i38.SignupUseCase>(
        () => _i38.SignupUseCase(gh<_i29.AuthRepo>()));
    gh.factory<_i39.MostSellingProductsViewModel>(() =>
        _i39.MostSellingProductsViewModel(
            gh<_i31.MostSellingProductsUsecase>()));
    gh.factory<_i40.AuthViewModel>(
        () => _i40.AuthViewModel(gh<_i38.SignupUseCase>()));
    return this;
  }
}
