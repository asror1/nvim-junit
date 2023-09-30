return {
	default = {
		"$PACKAGE_DECLARATION",
		"",
		"import org.junit.jupiter.api.DisplayName;",
		"import static org.junit.jupiter.api.Assertions.*",
		"import org.junit.jupiter.api.Test",
		"",
		[[@DisplayName("Container Name")]],
		[[@SuppressWarnings("unused")]],
		"class $TEST_NAME {",
		"",
		"@Test",
		[[@DisplayName("Test Name")]],
		"void testMethod() {",
		[[fail("Not implemented");]],
		"}",
		"",
		"},",
	},
	spring = {
		"$PACKAGE_DECLARATION",
		"",
		"import static org.mockito.ArgumentMatchers.*;",
		"import static org.mockito.Mockito.*;",
		"import static org.junit.jupiter.api.Assertions.*;",
		"import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;",
		"import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;",
		"import org.springframework.boot.test.context.SpringBootTest;",
		"import org.junit.jupiter.api.extension.ExtendWith;",
		"import org.mockito.junit.jupiter.MockitoExtension;",
		"import org.junit.jupiter.api.DisplayName;",
		"import org.junit.jupiter.api.Test;",
		"",
		"@SpringBootTest",
		[[@DisplayName("Container Name")]],
		[[@SuppressWarnings("unused")]],
		"class $TEST_NAME {",
		"",
		"@Test",
		[[@DisplayName("Test Name")]],
		"void testMethod() {",
		[[fail("Not implemented");]],
		"}",
		"}",
	},
	mockito = {
		"$PACKAGE_DECLARATION",
		"",
		"import static org.mockito.ArgumentMatchers.*;",
		"import static org.mockito.Mockito.*;",
		"import static org.junit.jupiter.api.Assertions.*;",
		"",
		"import org.junit.jupiter.api.extension.ExtendWith;",
		"import org.mockito.junit.jupiter.MockitoExtension;",
		"import org.junit.jupiter.api.DisplayName;",
		"import org.junit.jupiter.api.Test;",
		"",
		"@ExtendWith(MockitoExtension.class)",
		[[@DisplayName("Container Name")]],
		[[@SuppressWarnings("unused")]],
		"class %s {",
		"",
		"@Test",
		[[@DisplayName("Test Name")]],
		"void testMethod() {",
		[[fail("Not implemented");]],
		"}",
		"}",
	},
}
