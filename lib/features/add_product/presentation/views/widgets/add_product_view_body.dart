import 'package:flutter/material.dart';
import 'package:fruit_hup_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hup_dashboard/core/widgets/image_field.dart';
import 'package:fruit_hup_dashboard/features/add_product/presentation/views/widgets/custom_check_box.dart';
import 'package:fruit_hup_dashboard/features/add_product/presentation/views/widgets/is_featured_check_box.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              CustomTextFormField(
                hintText: 'Product Name',
                textInputType: TextInputType.text,
              ),

              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: 'Product price',
                textInputType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: 'Product code',
                textInputType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                maxLines: 5,
                hintText: 'Product description',
                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 16),

              IsFeaturedCheckBox(onChanged: (value) {}),
              SizedBox(height: 16),
              ImageField(onFileChanged: (image) {}),
            ],
          ),
        ),
      ),
    );
  }
}
